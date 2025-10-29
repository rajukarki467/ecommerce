import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frontend/feature/auth/data/models/user_creation_req.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/core/constants/api_constants.dart';
import 'package:frontend/feature/auth/data/models/user_signin_req.dart';

abstract class AuthBackendService {
  Future<Either<String, Map<String, dynamic>>> signin(UserSigninReq user);
  Future<Either<String, Map<String, dynamic>>> signup(UserCreationReq user);
}

class AuthBackendServiceImpl extends AuthBackendService {
  @override
  Future<Either<String, Map<String, dynamic>>> signin(
    UserSigninReq user,
  ) async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}/auth/login");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": user.email, "password": user.password}),
      );
      print(".....................$response.....................");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Right(data);
      } else {
        return Left("User Registration Failed ..: ${response.body}");
      }
    } catch (e) {
      return Left("Error connecting to server: $e");
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> signup(
    UserCreationReq user,
  ) async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}/auth/register");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": user.email,
          "password": user.password,
          "name": "${user.firstName} ${user.lastName}",
          "role": (user.role ?? "customer").toLowerCase().replaceAll("'", ""),
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return Right(data);
      } else {
        return Left("User Registration Failed ..: ${response.body}");
      }
    } catch (e) {
      return Left("Error connecting to server: $e");
    }
  }
}
