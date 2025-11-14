import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/network/network_info.dart';
import 'package:frontend/feature/home/data/model/post_data.dart' hide Post;
import 'package:frontend/feature/home/domain/entity/post.dart';
import 'package:get_it/get_it.dart';
import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/feature/auth/data/datasources/auth_backend_service.dart';
import 'package:frontend/feature/auth/data/datasources/local_user_service.dart';
import 'package:frontend/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:frontend/feature/auth/domain/repository/auth_repository.dart';
import 'package:frontend/feature/auth/domain/usecases/signin.dart';
import 'package:frontend/feature/auth/domain/usecases/signup.dart';
import 'package:frontend/feature/home/data/data_source/post_local_data_source.dart';
import 'package:frontend/feature/home/data/data_source/post_remote_data_source.dart';
import 'package:frontend/feature/home/data/repository/post_repository_impl.dart';
import 'package:frontend/feature/home/domain/repository/post_repository.dart';
import 'package:frontend/feature/home/domain/usecases/create_post.dart';
import 'package:frontend/feature/home/domain/usecases/get_posts.dart';
import 'package:frontend/feature/home/domain/usecases/toggleLike.dart';
import 'package:frontend/feature/home/presentation/bloc/post_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //checking network connectivity
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => NetworkInfo(sl<Connectivity>()));

  // ✅ Hive is initialized once here
  await Hive.initFlutter();
  Hive.registerAdapter(PostDataAdapter());
  final postBox = await Hive.openBox<PostData>('posts');

  // 🗂️ Local data source
  sl.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSourceImpl(postBox),
  );

  // 🧠 Local user service
  sl.registerLazySingleton<LocalUserService>(() => LocalUserServiceImpl());

  // 🌐 Network
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl(), sl()));

  // 👤 Auth
  sl.registerSingleton<AuthBackendService>(AuthBackendServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  // 📰 Post
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(sl<ApiClient>()),
  );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      sl<PostRemoteDataSource>(),
      sl<PostLocalDataSource>(),
      sl<NetworkInfo>(),
    ),
  );

  // 🧩 Use Cases
  sl.registerLazySingleton(() => GetPosts(sl()));
  sl.registerLazySingleton(() => CreatePost(sl()));
  sl.registerLazySingleton(() => ToggleLike(sl()));

  // ⚡ Bloc
  sl.registerFactory(() => PostBloc(sl(), sl(), sl()));
}
