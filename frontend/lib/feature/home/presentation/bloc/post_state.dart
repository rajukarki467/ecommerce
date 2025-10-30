part of 'post_bloc.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded(this.posts);
}

class PostCreated extends PostState {
  final Post post;
  PostCreated(this.post);
}

class PostLiked extends PostState {
  final Post post;
  PostLiked(this.post);
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}
