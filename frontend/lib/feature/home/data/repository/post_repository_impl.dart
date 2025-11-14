import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';
import 'package:frontend/feature/home/data/data_source/post_remote_data_source.dart';
import 'package:frontend/feature/home/data/data_source/post_local_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Post>> getPosts() async {
    try {
      final posts = await remoteDataSource.getPosts();
      print(".................${posts.length}................");
      print(posts);

      // Save locally and wait for it
      await localDataSource.cachePosts(posts);

      // Then confirm cache
      final cached = await localDataSource.getCachedPosts();
      print("📦 Cached posts after save: ${cached.length}");

      return posts;
    } catch (e) {
      // fallback to local cache if offline
      final cachedPosts = await localDataSource.getCachedPosts();
      print("📦 Retrieved cached posts (offline): ${cachedPosts.length}");
      return cachedPosts;
    }
  }

  @override
  Future<Post> createPost(String caption, String? imagePath) async {
    final post = await remoteDataSource.createPost(caption, imagePath);
    await localDataSource.savePost(post);
    return post;
  }

  @override
  Future<Post> toggleLike(String postId) async {
    final post = await remoteDataSource.toggleLike(postId);
    await localDataSource.savePost(post);
    return post;
  }
}
