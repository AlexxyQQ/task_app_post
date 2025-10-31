import '../../../core/common/presentation/helpers/file_picker.helper.dart';
import '../../../core/di/main.di.dart';
import '../data/data_sources/local/user.local.data_source.dart';
import '../presentation/bloc/user/user.bloc.dart';

class UserDI {
  static void register() {
    // Data Source
    // remote
    sl
      ..registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource())
      // Bloc
      ..registerFactory<UserBloc>(
        () => UserBloc(localSource: sl<UserLocalDataSource>()),
      );
  }
}
