import 'package:fpdart/src/either.dart';
import 'package:frontend/feature/auth/data/datasources/auth_backend_service.dart';
import 'package:frontend/feature/auth/data/models/user_creation_req.dart';
import 'package:frontend/feature/auth/data/models/user_signin_req.dart';
import 'package:frontend/feature/auth/domain/repository/auth_repository.dart';
import 'package:frontend/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(UserSigninReq user) async {
    return await sl<AuthBackendService>().signin(user);
  }

  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthBackendService>().signup(user);
  }
}
