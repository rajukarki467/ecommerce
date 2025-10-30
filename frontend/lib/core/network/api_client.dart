import 'package:dio/dio.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart';
import 'api_constants.dart';

class ApiClient {
  final Dio dio;
  final LocalUserService localUserService;

  ApiClient(this.dio, this.localUserService) {
    dio.options
      ..baseUrl = ApiConstants.baseUrl
      ..responseType = ResponseType.json;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await localUserService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          print('🚨 Dio Error: ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> get(String url) => dio.get(url);
  Future<Response> post(String url, dynamic data) => dio.post(url, data: data);
  Future<Response> patch(String url, dynamic data) =>
      dio.patch(url, data: data);
}
