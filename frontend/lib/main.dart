import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/config/theme/app_theme.dart';
import 'package:frontend/feature/auth/data/models/hive_user.dart';
import 'package:frontend/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/common/cubit/splash_cubit.dart';
import 'package:frontend/feature/home/presentation/bloc/post_bloc.dart';
import 'package:frontend/feature/splash/presentation/pages/splash.dart';
import 'package:frontend/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  //hive using generate the adpator
  await Hive.initFlutter();
  Hive.registerAdapter(HiveUserAdapter());
  await Hive.openBox<HiveUser>('userBox');
  await Hive.openBox<String>('tokenBox');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => sl<PostBloc>()),
      ],
      child: MyApp(),
    ),
  );
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
