import 'package:frontend/core/network/network_info.dart';
import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';
import 'package:frontend/feature/home/data/data_source/post_remote_data_source.dart';
import 'package:frontend/feature/home/data/data_source/post_local_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.networkInfo,
  );

  @override
  Future<List<Post>> getPosts() async {
    try {
      if (await networkInfo.isConnected) {
        final posts = await remoteDataSource.getPosts();
        // Save locally and wait for it
        await localDataSource.cachePosts(posts);
        return posts;
      } else {
        // Then confirm cache
        final cached = await localDataSource.getCachedPosts();

        return cached;
      }
    } catch (e) {
      // fallback to local cache if offline
      final cachedPosts = await localDataSource.getCachedPosts();
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
