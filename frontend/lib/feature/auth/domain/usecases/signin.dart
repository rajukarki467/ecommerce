import 'package:fpdart/fpdart.dart';
import 'package:frontend/core/usecase/usecase.dart';
import 'package:frontend/feature/auth/data/models/user_signin_req.dart';
import 'package:frontend/feature/auth/domain/repository/auth_repository.dart';
import 'package:frontend/service_locator.dart';

class SignInUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
