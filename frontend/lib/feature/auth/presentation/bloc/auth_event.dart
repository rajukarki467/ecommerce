part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInRequested extends AuthEvent {
  final UserSigninReq userSigninReq;
  SignInRequested(this.userSigninReq);
}

class SignUpRequested extends AuthEvent {
  final UserCreationReq userCreationReq;

  SignUpRequested(this.userCreationReq);
}
