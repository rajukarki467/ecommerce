import 'package:hive/hive.dart';

part 'post_data.g.dart';

@HiveType(typeId: 1) // 👈 important: use a unique typeId (not 0)
class PostData extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String caption;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final String user;

  @HiveField(4)
  final List<String> likes;

  @HiveField(5)
  final DateTime createdAt;

  PostData({
    required this.id,
    required this.caption,
    required this.imageUrl,
    required this.user,
    required this.likes,
    required this.createdAt,
  });
}
