import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/entities/user.dart';
import 'package:frontend/feature/auth/data/models/user_creation_req.dart';
import 'package:frontend/feature/auth/data/models/user_signin_req.dart';
import 'package:frontend/feature/auth/domain/usecases/signin.dart';
import 'package:frontend/feature/auth/domain/usecases/signup.dart';
import 'package:frontend/service_locator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await sl<SignInUseCase>().call(params: event.userSigninReq);
    // print(result);

    result.fold(
      (failure) => emit(AuthFailure(failure.toString())),
      (data) => emit(AuthSuccess(User.fromMap(data))),
    );
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await sl<SignUpUseCase>().call(
      params: event.userCreationReq,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.toString())),
      (data) => emit(AuthSuccess(User.fromMap(data))),
    );
  }
}
