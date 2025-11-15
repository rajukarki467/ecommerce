import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/home/presentation/bloc/post_bloc.dart';
import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/presentation/pages/profile/PostDetailPage.dart';

class PostFeedScreen extends StatelessWidget {
  final String currentUser; // 👈 pass the logged-in username

  const PostFeedScreen({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostBloc>();

    // Fetch posts when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      postBloc.add(LoadPosts());
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostCreated) {
            postBloc.add(LoadPosts());
          }
        },
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostLoaded) {
            // ✅ Filter only posts from the current user
            final userPosts = state.posts
                .where((post) => post.user == currentUser)
                .toList();

            if (userPosts.isEmpty) {
              return const Center(
                child: Text(
                  "You haven’t uploaded any posts yet 💤",
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                postBloc.add(LoadPosts());
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: userPosts.length,
                itemBuilder: (context, index) {
                  final post = userPosts[index];

                  return GestureDetector(
                    onTap: () {
                      // Open the post detail when tapped
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.black,
                        isScrollControlled: true,
                        builder: (_) =>
                            _buildPostDetail(post, postBloc, context),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, _, __) => const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          if (state is PostError) {
            return Center(
              child: Text(
                state.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // Your existing _buildPostDetail method
  Widget _buildPostDetail(Post post, PostBloc postBloc, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the new PostDetailPage when the image is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PostDetailPage(post: post), // Pass the post to the new page
          ),
        );
      },
      child: SingleChildScrollView(
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
                      onTap: () => postBloc.add(LikePost(post.id)),
                      child: Image.asset(
                        post.likes.isNotEmpty
                            ? "assets/images/likedfil.png"
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
