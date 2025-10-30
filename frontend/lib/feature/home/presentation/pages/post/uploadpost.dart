import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/home/presentation/bloc/post_bloc.dart';
import 'package:frontend/service_locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({super.key});

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  final TextEditingController _captionController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    var status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.storage.request();
    }

    if (await Permission.photos.isGranted ||
        await Permission.storage.isGranted) {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) setState(() => _selectedImage = File(picked.path));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Permission denied")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final postBloc = sl<PostBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Create Post",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        toolbarHeight: 80,
      ),
      body: BlocProvider(
        create: (_) => postBloc,
        child: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostCreated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("✅ Post created successfully")),
              );
              _captionController.clear();
              setState(() => _selectedImage = null);
            }
          },
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: _selectedImage == null
                        ? Container(
                            height: 270,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey,
                                    ),
                                    child: Icon(Icons.cloud_upload, size: 32),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Tap to select image",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Image.file(_selectedImage!, height: 200),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _captionController,
                    decoration: const InputDecoration(
                      hintText: "Write a caption...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  UiHelper.CustomButton(
                    buttonname: "Upload Post",
                    callback: () {
                      postBloc.add(
                        CreateNewPost(
                          _captionController.text,
                          _selectedImage?.path,
                        ),
                      );
                    },
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {
                  //       postBloc.add(
                  //         CreateNewPost(
                  //           _captionController.text,
                  //           _selectedImage?.path,
                  //         ),
                  //       );
                  //     },
                  //     icon: const Icon(
                  //       Icons.cloud_upload_outlined,
                  //       color: Colors.white,
                  //     ),
                  //     label: const Text(
                  //       "Upload Post",
                  //       style: TextStyle(color: Colors.white, fontSize: 14),
                  //     ),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.blueAccent,
                  //       padding: const EdgeInsets.symmetric(vertical: 14),
                  //       elevation: 0,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
