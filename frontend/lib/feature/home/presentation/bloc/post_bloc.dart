import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:frontend/feature/home/domain/usecases/toggleLike.dart';
import '../../domain/usecases/get_posts.dart';
import '../../domain/usecases/create_post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;
  final CreatePost createPost;
  final ToggleLike toggleLike;

  PostBloc(this.getPosts, this.createPost, this.toggleLike)
    : super(PostInitial()) {
    on<LoadPosts>((event, emit) async {
      try {
        emit(PostLoading());
        final posts = await getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError('Failed to like post: $e'));
      }
    });

    on<CreateNewPost>((event, emit) async {
      try {
        emit(PostLoading());
        final post = await createPost(event.caption, event.imagePath);
        emit(PostCreated(post));
      } catch (e) {
        emit(PostError('Failed to like post: $e'));
      }
    });

    on<LikePost>((event, emit) async {
      try {
        final post = await toggleLike(event.postId);
        emit(PostLiked(post));
      } catch (e) {
        emit(PostError('Failed to like post: $e'));
      }
    });
  }
}
