import 'package:flutter/material.dart';
import 'package:frontend/feature/home/domain/entity/post.dart';

class PostDetailPage extends StatelessWidget {
  final Post post; // Post object passed from the previous page

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.user), backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🧑🏻 User Info
              Container(
                height: 54,
                color: Colors.black12,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/person1.png"),
                  ),
                  title: Text(
                    post.user,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  subtitle: Text(
                    "${post.createdAt.toLocal()}".split(' ')[0],
                    style: const TextStyle(fontSize: 11, color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // 🖼️ Image Full
              Container(
                height: 400,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(post.imageUrl, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),

              // ❤️ Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle like action, you can trigger the like event here
                      },
                      child: Image.asset(
                        post.likes.isNotEmpty
                            ? "assets/images/LikeFilled.png"
                            : "assets/images/Like.png",
                        height: 28,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Image.asset("assets/images/Comment.png", height: 26),
                    const SizedBox(width: 20),
                    Image.asset("assets/images/Messanger.png", height: 26),
                    const Spacer(),
                    Image.asset("assets/images/Save.png", height: 26),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 💬 Likes Count
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "${post.likes.length} likes",
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),

              // 📝 Caption
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "${post.user} ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: post.caption),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
