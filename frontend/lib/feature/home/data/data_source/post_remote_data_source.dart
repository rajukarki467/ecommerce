import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/core/network/api_constants.dart';
import 'package:frontend/feature/home/data/model/post_model.dart';
import 'package:frontend/core/network/api_client.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
  Future<PostModel> createPost(String caption, String? imagePath);
  Future<PostModel> toggleLike(String postId);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiClient client;

  PostRemoteDataSourceImpl(this.client);

  @override
  Future<PostModel> createPost(String caption, String? imagePath) async {
    try {
      final formData = FormData.fromMap({
        'caption': caption,
        if (imagePath != null)
          'image': await MultipartFile.fromFile(
            imagePath,
            filename: 'upload.jpg',
          ),
      });

      final response = await client.post(ApiConstants.posts, formData);

      // Handle case when response.data is a String (e.g. multipart responses)
      final decoded = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (decoded is Map && decoded['post'] is Map) {
        return PostModel.fromJson(decoded['post']);
      } else {
        throw Exception('Invalid API response format: $decoded');
      }
    } catch (e, s) {
      print('createPost error: $e\n$s');
      rethrow;
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await client.get(ApiConstants.posts);
      final decoded = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      final data = (decoded['posts'] as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
      return data;
    } catch (e) {
      print('❌ getPosts error: $e');
      rethrow;
    }
  }

  @override
  Future<PostModel> toggleLike(String postId) async {
    try {
      final response = await client.patch(
        '${ApiConstants.posts}/$postId/like',
        null,
      );

      final decoded = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      return PostModel.fromJson(decoded['post']);
    } catch (e) {
      print('❌ toggleLike error: $e');
      rethrow;
    }
  }
}
