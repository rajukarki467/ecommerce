class Post {
  final String id;
  final String caption;
  final String imageUrl;
  final String user;
  final List<String> likes;
  final DateTime createdAt;

  Post({
    required this.id,
    required this.caption,
    required this.imageUrl,
    required this.user,
    required this.likes,
    required this.createdAt,
  });
}
