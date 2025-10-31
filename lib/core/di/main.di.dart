import 'package:get_it/get_it.dart';

import '../../config/observers/app_route.oserver.dart';
import '../../config/observers/bloc_observer.dart';
import '../../features/post/di/post.di.dart';
import '../../features/user/di/user.di.dart';
import '../common/data/data_source/local/app_setting.local.data_source.dart';
import '../common/domain/services/api/dio.service.dart';
import '../common/domain/services/navigation/navigation.service.dart';
import '../common/domain/services/storage/secure_storage.service.dart';
import '../common/presentation/bloc/app_setting.bloc.dart';
import '../common/presentation/helpers/date_time_helper.dart';
import '../common/presentation/helpers/file_picker.helper.dart';
import '../common/presentation/routes/app_router.dart';

/// Service locator instance for dependency injection
final sl = GetIt.instance;

/// Main dependency injection class that registers all dependencies for the application
class MainDI {
  /// Registers all dependencies required for the application
  Future<void> register() async {
    sl
      // ==== App Router ====
      ..registerLazySingleton(() => AppRouter())
      // ==== Observers ====
      ..registerFactory(() => AppRouteObserver())
      ..registerLazySingleton<AppBlocObserver>(() => AppBlocObserver())
      // ==== Helpers ====
      ..registerLazySingleton<DateTimeHelper>(() => DateTimeHelper())
      ..registerLazySingleton<IFileSelectorHelper>(
        () => FileSelectorHelperImpl(),
      )
      // ==== Services ====
      ..registerLazySingleton<DioService>(() => DioService())
      ..registerCachedFactory(() => NavigationService(sl<AppRouter>()))
      ..registerLazySingleton<SecureStorageService>(
        () => SecureStorageService(),
      )
      // ==== Data Sources ====
      ..registerLazySingleton(() => AppSettingLocalDataSource())
      // ==== Blocs ====
      ..registerLazySingleton(
        () => AppSettingBloc(dataSource: sl<AppSettingLocalDataSource>()),
      );

    // ==== Features ====
    PostDI.register();
    UserDI.register();
  }
}
