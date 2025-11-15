import 'package:frontend/feature/home/domain/entity/post.dart';

class PostModel extends Post {
  PostModel({
    required super.id,
    required super.caption,
    required super.imageUrl,
    required super.user,
    required super.likes,
    required super.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final userField = json['user'];

    return PostModel(
      id: json['_id'] ?? '',
      caption: json['caption'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      user: userField is Map
          ? userField['name']?.toString() ?? 'Unknown'
          : userField?.toString() ?? 'Unknown',
      likes: List<String>.from(json['likes'] ?? []),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'caption': caption,
      'imageUrl': imageUrl,
      'user': user,
      'likes': likes,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
