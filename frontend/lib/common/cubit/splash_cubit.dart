import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/cubit/splash_state.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart';
import 'package:frontend/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    final localUserService = sl<LocalUserService>();

    emit(DisplaySplash());
    await Future.delayed(const Duration(seconds: 2));

    try {
      final isLoggedIn = await localUserService.isAuthenticated();

      if (isLoggedIn) {
        emit(Authenticated());
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      // In case reading from storage fails
      emit(UnAuthenticated());
    }
  }
}
