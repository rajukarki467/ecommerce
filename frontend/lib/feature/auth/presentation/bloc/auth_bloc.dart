import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/entities/user.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart'
    show LocalUserService;
import 'package:frontend/feature/auth/data/models/hive_user.dart';
import 'package:frontend/feature/auth/data/models/user_creation_req.dart';
import 'package:frontend/feature/auth/data/models/user_signin_req.dart';
import 'package:frontend/feature/auth/domain/usecases/signin.dart';
import 'package:frontend/feature/auth/domain/usecases/signup.dart';
import 'package:frontend/service_locator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalUserService _localUserService = sl<LocalUserService>();

  AuthBloc() : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await sl<SignInUseCase>().call(params: event.userSigninReq);

    result.fold((failure) => emit(AuthFailure(failure.toString())), (
      data,
    ) async {
      final user = User.fromMap(data);
      await sl<LocalUserService>().saveUserFromEntity(user);
      emit(AuthSuccess(user));
    });
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await sl<SignUpUseCase>().call(
      params: event.userCreationReq,
    );
    result.fold((failure) => emit(AuthFailure(failure.toString())), (
      data,
    ) async {
      final user = User.fromMap(data);
      await sl<LocalUserService>().saveUserFromEntity(user);
      emit(AuthSuccess(user));
    });
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _localUserService.clearUser();
    emit(AuthInitial());
  }
}
