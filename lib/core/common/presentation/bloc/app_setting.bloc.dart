import 'package:fpdart/fpdart.dart';
import '../../../../core/abstract/presentation/bloc/crud/crud.bloc.dart';
import '../../../../core/common/data/models/error/app_error.model.dart';
import '../../data/data_source/local/app_setting.local.data_source.dart';
import '../../data/models/setting/app_setting.model.dart';

class AppSettingBloc extends CrudBloc<AppSettingModel, String> {
  AppSettingBloc({required AppSettingLocalDataSource dataSource})
    : _dataSource = dataSource;
  final AppSettingLocalDataSource _dataSource;

  @override
  String getEntityId(AppSettingModel entity) {
    return 'app_setting';
  }

  @override
  Future<Either<AppErrorModel, List<AppSettingModel>>> readAllEntities() {
    return _dataSource.read();
  }

  @override
  Future<Either<AppErrorModel, AppSettingModel>> createEntity(
    AppSettingModel entity,
  ) {
    // TODO: implement createEntity
    throw UnimplementedError();
  }

  @override
  Future<Either<AppErrorModel, void>> deleteEntity(String id) async {
    await _dataSource.delete();
    return const Right(null);
  }

  @override
  Future<Either<AppErrorModel, AppSettingModel>> readEntity(String id) async {
    final result = await _dataSource.read();
    return result.fold((l) => Left(l), (r) {
      if (r.isEmpty) {
        return const Right(AppSettingModel());
      }
      return Right(r.first);
    });
  }

  @override
  Future<Either<AppErrorModel, AppSettingModel>> updateEntity(
    AppSettingModel entity,
  ) async {
    final result = await _dataSource.upsertItem(
      test: (e) => true,
      value: entity,
    );
    return result.fold((l) => Left(l), (r) => Right(entity));
  }

  @override
  Future<Either<AppErrorModel, List<AppSettingModel>>> createEntities(
    List<AppSettingModel> entities,
  ) {
    // TODO: implement createEntities
    throw UnimplementedError();
  }
}
