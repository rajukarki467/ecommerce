import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';

class CreatePost {
  final PostRepository postRepository;

  CreatePost(this.postRepository);

  Future<Post> call(String caption, String? imagePath) async {
    return await postRepository.createPost(caption, imagePath);
  }
}
