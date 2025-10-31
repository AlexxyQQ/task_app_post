import 'package:fpdart/fpdart.dart';

import '../../../../../core/abstract/presentation/bloc/crud/crud.bloc.dart';
import '../../../../../core/common/data/models/error/app_error.model.dart';
import '../../../data/data_sources/local/user.local.data_source.dart';
import '../../../data/models/user.model.dart';

class UserBloc extends CrudBloc<UserModel, String> {
  UserBloc({required UserLocalDataSource localSource})
    : _localSource = localSource;
  final UserLocalDataSource _localSource;

  @override
  String getEntityId(UserModel entity) {
    return entity.id;
  }

  @override
  Future<Either<AppErrorModel, List<UserModel>>> readAllEntities() async {
    final result = await _localSource.read();
    return result.fold((l) => Left(l), (r) => Right(r));
  }

  @override
  Future<Either<AppErrorModel, UserModel>> createEntity(
    UserModel entity,
  ) async {
    final result = await _localSource.create(value: entity);
    return result.fold((l) => Left(l), (r) => Right(entity));
  }

  @override
  Future<Either<AppErrorModel, void>> deleteEntity(String id) async {
    final result = await _localSource.deleteWhere(
      test: (data) => data.id == id,
    );
    return result.fold((l) => Left(l), (r) => const Right(null));
  }

  @override
  Future<Either<AppErrorModel, UserModel>> readEntity(String id) async {
    final result = await _localSource.where(test: (data) => data.id == id);
    return result.fold((l) => Left(l), (r) {
      final model = r.firstOrNull;
      if (model != null) {
        return Right(model);
      } else {
        return const Left(AppErrorModel(message: 'Not found'));
      }
    });
  }

  @override
  Future<Either<AppErrorModel, UserModel>> updateEntity(
    UserModel entity,
  ) async {
    final result = await _localSource.updateWhere(
      test: (e) => e.id == entity.id,
      newValue: entity,
    );
    return result.fold((l) => Left(l), (r) => Right(entity));
  }

  @override
  Future<Either<AppErrorModel, List<UserModel>>> createEntities(
    List<UserModel> entities,
  ) {
    // TODO: implement createEntities
    throw UnimplementedError();
  }
}
