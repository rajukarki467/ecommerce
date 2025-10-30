part of 'post_bloc.dart';

abstract class PostEvent {}

class LoadPosts extends PostEvent {}

class CreateNewPost extends PostEvent {
  final String caption;
  final String? imagePath;

  CreateNewPost(this.caption, this.imagePath);
}

class LikePost extends PostEvent {
  final String postId;
  LikePost(this.postId);
}
