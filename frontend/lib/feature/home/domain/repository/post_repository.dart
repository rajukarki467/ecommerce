import 'package:frontend/feature/home/domain/entity/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> createPost(String caption, String? imagePath);
  Future<Post> toggleLike(String postId);
}
