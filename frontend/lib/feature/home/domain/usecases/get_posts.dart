import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';

class GetPosts {
  final PostRepository postRepository;
  GetPosts(this.postRepository);

  Future<List<Post>> call() async {
    return await postRepository.getPosts();
  }
}
