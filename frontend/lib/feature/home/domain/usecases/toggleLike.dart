import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';

class ToggleLike {
  final PostRepository postRepository;

  ToggleLike(this.postRepository);

  Future<Post> call(String postId) async {
    return await postRepository.toggleLike(postId);
  }
}
