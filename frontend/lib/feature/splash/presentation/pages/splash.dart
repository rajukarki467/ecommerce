import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common/helper/navigator/app_navigator.dart';
import 'package:frontend/core/assets/app_images.dart';
import 'package:frontend/core/config/theme/app_color.dart';
import 'package:frontend/feature/auth/presentation/pages/signin.dart';
import 'package:frontend/feature/home/presentation/pages/home.dart';
import 'package:frontend/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:frontend/feature/splash/presentation/cubit/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SignIn());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splash),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
