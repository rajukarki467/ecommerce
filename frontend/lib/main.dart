import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/config/theme/app_theme.dart';
import 'package:frontend/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:frontend/feature/splash/presentation/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
