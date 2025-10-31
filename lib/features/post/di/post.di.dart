import '../../../core/di/main.di.dart';
import '../data/data_sources/local/post.local.data_source.dart';
import '../data/data_sources/remote/post.remote.data_source.dart';
import '../data/repositories/post.repositories.impl.dart';
import '../domain/repositories/post.repository.dart';
import '../presentation/bloc/post.bloc.dart';

class PostDI {
  static void register() {
    sl
      // Services
      ..registerLazySingleton(() => PostLocalDataSourceService())
      // Data sources
      ..registerLazySingleton<PostRemoteDataSource>(
        () => PostRemoteDataSource(),
      )
      ..registerLazySingleton<PostLocalDataSource>(
        () => PostLocalDataSource(sl()),
      )
      // Repositories
      ..registerLazySingleton<IPostRepository>(
        () => PostRepositoryImpl(
          remoteDataSource: sl<PostRemoteDataSource>(),
          localDataSource: sl<PostLocalDataSource>(),
        ),
      )
      // Blocs
      ..registerFactory<PostBloc>(
        () => PostBloc(repository: sl<IPostRepository>()),
      );
  }
}
