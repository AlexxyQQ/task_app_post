import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/abstract/presentation/bloc/crud/crud.bloc.dart';
import '../../../../core/common/data/models/error/app_error.model.dart';
import '../../data/models/post.model.dart';
import '../../domain/repositories/post.repository.dart';

class PostBloc extends CrudBloc<PostModel, String> {
  PostBloc({required IPostRepository repository}) : _repository = repository {
    on<FetchPostLocally>(_fetchLocally);
  }

  final IPostRepository _repository;
  Future<void> _fetchLocally(
    FetchPostLocally event,
    Emitter<CrudState<PostModel>> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await _repository.getAllPost(apiFetch: false);
    result.fold(
      (error) => emit(state.copyWith(error: error, isLoading: false)),
      (entities) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            entities: entities,
            filteredEntities: [],
          ),
        );
      },
    );
    if (state.entities.isEmpty) {
      add(GetAllEntitiesEvent());
    }
  }

  @override
  Future<Either<AppErrorModel, List<PostModel>>> createEntities(
    List<PostModel> entities,
  ) {
    // TODO: implement createEntities
    throw UnimplementedError();
  }

  @override
  Future<Either<AppErrorModel, PostModel>> createEntity(PostModel entity) {
    return _repository.addPost(post: entity);
  }

  @override
  Future<Either<AppErrorModel, void>> deleteEntity(String id) {
    return _repository.deletePost(id: id);
  }

  @override
  String getEntityId(PostModel entity) {
    return entity.id.toString();
  }

  @override
  Future<Either<AppErrorModel, List<PostModel>>> readAllEntities() {
    return _repository.getAllPost();
  }

  @override
  Future<Either<AppErrorModel, PostModel>> readEntity(String id) {
    return _repository.getPost(id: id);
  }

  @override
  Future<Either<AppErrorModel, PostModel>> updateEntity(PostModel entity) {
    return _repository.updatePost(post: entity);
  }
}

class FetchPostLocally extends CrudEvent<PostModel> {}
