import 'package:fpdart/fpdart.dart';
import 'package:frontend/feature/auth/data/models/user_creation_req.dart';
import 'package:frontend/feature/auth/data/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> signin(UserSigninReq user);
  Future<Either> signup(UserCreationReq user);
}
