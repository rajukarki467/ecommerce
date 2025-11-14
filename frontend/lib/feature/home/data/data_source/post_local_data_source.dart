import 'package:frontend/feature/home/data/model/post_data.dart';
import 'package:hive/hive.dart';
import 'package:frontend/feature/home/domain/entity/post.dart';

abstract class PostLocalDataSource {
  Future<void> cachePosts(List<Post> posts);
  Future<List<Post>> getCachedPosts();
  Future<void> savePost(Post post);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final Box<PostData> box;
  PostLocalDataSourceImpl(this.box);

  @override
  Future<void> cachePosts(List<Post> posts) async {
    await box.clear();
    final postDataList = posts
        .map(
          (p) => PostData(
            id: p.id,
            caption: p.caption,
            imageUrl: p.imageUrl,
            user: p.user,
            likes: p.likes,
            createdAt: p.createdAt,
          ),
        )
        .toList();

    await box.addAll(postDataList);
    print('✅ Cached ${postDataList.length} posts in Hive');
  }

  @override
  Future<List<Post>> getCachedPosts() async {
    final cachedData = box.values.toList();
    final posts = cachedData
        .map(
          (pd) => Post(
            id: pd.id,
            caption: pd.caption,
            imageUrl: pd.imageUrl,
            user: pd.user,
            likes: pd.likes,
            createdAt: pd.createdAt,
          ),
        )
        .toList();

    print('📦 Retrieved ${posts.length} cached posts');
    return posts;
  }

  @override
  Future<void> savePost(Post post) async {
    final pd = PostData(
      id: post.id,
      caption: post.caption,
      imageUrl: post.imageUrl,
      user: post.user,
      likes: post.likes,
      createdAt: post.createdAt,
    );
    await box.put(post.id, pd);
    print('📝 Saved post locally with id: ${post.id}');
  }
}
