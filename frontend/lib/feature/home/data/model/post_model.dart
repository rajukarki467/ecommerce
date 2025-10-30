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
    return PostModel(
      id: json['_id'] ?? '',
      caption: json['caption'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      user: json['user']?['name'].toString() ?? 'Unknown',
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
