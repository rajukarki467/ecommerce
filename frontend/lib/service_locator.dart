import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/feature/auth/data/datasources/auth_backend_service.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart';
import 'package:frontend/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:frontend/feature/auth/domain/repository/auth_repository.dart';
import 'package:frontend/feature/auth/domain/usecases/signin.dart';
import 'package:frontend/feature/auth/domain/usecases/signup.dart';
import 'package:frontend/feature/home/data/data_source/post_remote_data_source.dart';
import 'package:frontend/feature/home/data/repository/post_repository_impl.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';
import 'package:frontend/feature/home/domain/usecases/create_post.dart';
import 'package:frontend/feature/home/domain/usecases/get_posts.dart';
import 'package:frontend/feature/home/domain/usecases/toggleLike.dart';
import 'package:frontend/feature/home/presentation/bloc/post_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Local storage
  sl.registerLazySingleton<LocalUserService>(() => LocalUserServiceImpl());

  // Dio + ApiClient
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl(), sl()));

  // Auth
  sl.registerSingleton<AuthBackendService>(AuthBackendServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  // Post feature
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(sl<ApiClient>()),
  );

  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(sl<PostRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => GetPosts(sl()));
  sl.registerLazySingleton(() => CreatePost(sl()));
  sl.registerLazySingleton(() => ToggleLike(sl()));

  // Bloc (factory = new instance each time)
  sl.registerFactory(() => PostBloc(sl(), sl(), sl()));
}
