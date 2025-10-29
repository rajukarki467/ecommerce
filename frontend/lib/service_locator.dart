import 'package:frontend/feature/auth/data/datasources/auth_backend_service.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart';
import 'package:frontend/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:frontend/feature/auth/domain/repository/auth_repository.dart';
import 'package:frontend/feature/auth/domain/usecases/signin.dart';
import 'package:frontend/feature/auth/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthBackendService>(AuthBackendServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // local storage
  sl.registerLazySingleton<LocalUserService>(() => LocalUserServiceImpl());

  //UseCases

  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
}
