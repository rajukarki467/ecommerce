import 'package:frontend/feature/home/data/data_source/post_remote_data_source.dart';
import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts() => remoteDataSource.getPosts();

  @override
  Future<Post> createPost(String caption, String? imagePath) =>
      remoteDataSource.createPost(caption, imagePath);

  @override
  Future<Post> toggleLike(String postId) => remoteDataSource.toggleLike(postId);
}
