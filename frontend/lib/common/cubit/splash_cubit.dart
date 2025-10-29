import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/cubit/splash_state.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart';
import 'package:frontend/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    final LocalUserService localUserService = sl<LocalUserService>();
    await Future.delayed(const Duration(seconds: 2));
    final isLoggedIn = localUserService.isAuthenticated();

    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
