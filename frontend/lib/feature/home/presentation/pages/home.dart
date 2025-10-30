import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/presentation/bloc/post_bloc.dart';
import 'package:frontend/common/widgets/uihelper.dart';
import 'package:frontend/feature/home/presentation/pages/messages/messages_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostBloc>();

    // Fetch posts when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      postBloc.add(LoadPosts());
    });
    var arrHomeContent = [
      {
        "name": "Your Story",
        "img":
            "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
      },
      {
        "name": "kareena",
        "img":
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "name": "Zackjhon",
        "img":
            "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      },
      {
        "name": "suman",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0G-W3JsDJFxxtbina79OHNYIDSb9wB0M6kUN1ZDNmLd41CKdr-1sO7gGNp2yp3cw4zGQ&usqp=CAU",
      },
      {
        "name": "Your Story",
        "img":
            "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
      },
      {
        "name": "kareena",
        "img":
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      },
      {
        "name": "Zackjhon",
        "img":
            "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
      },
      {
        "name": "suman",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0G-W3JsDJFxxtbina79OHNYIDSb9wB0M6kUN1ZDNmLd41CKdr-1sO7gGNp2yp3cw4zGQ&usqp=CAU",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        backgroundColor: Colors.black12,
        leading: UiHelper.CustomImage(imgurl: "Camera Icon.png"),
        title: UiHelper.CustomImage(imgurl: "Instagram Logo (1).png"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: UiHelper.CustomImage(imgurl: "IGTV.png"),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesScreen()),
              );
            },
            icon: UiHelper.CustomImage(imgurl: "Messanger.png"),
          ),
        ],
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostCreated) {
            // after new post, reload posts
            postBloc.add(LoadPosts());
          }
        },
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostLoaded) {
            final posts = state.posts;
            if (posts.isEmpty) {
              return const Center(
                child: Text(
                  "No posts yet 💤",
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                postBloc.add(LoadPosts());
              },
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return _buildPostCard(context, posts[index], postBloc);
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

  // 🖼️ Post Card Widget
  Widget _buildPostCard(BuildContext context, Post post, PostBloc postBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🧑🏻 User info bar
        Container(
          height: 54,
          width: double.infinity,
          color: Colors.black12,
          child: ListTile(
            leading: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/person1.png"),
            ),
            title: Text(
              post.user,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
            subtitle: Text(
              "${post.createdAt.toLocal()}".split(' ')[0],
              style: const TextStyle(fontSize: 11, color: Colors.white70),
            ),
            trailing: Image.asset("assets/images/More Icon.png", height: 20),
          ),
        ),

        const SizedBox(height: 8),

        // 📷 Post image
        Container(
          height: 375,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.network(
            post.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, _, __) => const Center(
              child: Icon(Icons.broken_image, color: Colors.white38),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ❤️ Buttons Row (Like, Comment, Share, Save)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => postBloc.add(LikePost(post.id)),
                child: Image.asset(
                  post.likes.isNotEmpty
                      ? "assets/images/LikeFilled.png"
                      : "assets/images/Like.png",
                  height: 24,
                ),
              ),
              const SizedBox(width: 20),
              Image.asset("assets/images/Comment.png", height: 24),
              const SizedBox(width: 20),
              Image.asset("assets/images/Messanger.png", height: 24),
              const Spacer(),
              Image.asset("assets/images/Save.png", height: 24),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // 💬 Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "${post.likes.length} likes",
            style: const TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),

        // 📝 Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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

        const SizedBox(height: 20),
      ],
    );
  }
}
