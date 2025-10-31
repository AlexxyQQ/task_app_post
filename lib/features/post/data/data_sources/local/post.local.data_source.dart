import 'dart:convert';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/abstract/data/data_source/abstract.secure_storage.data_source.dart';
import '../../../../../core/common/data/models/error/app_error.model.dart';
import '../../../../../core/common/domain/services/storage/secure_storage.service.dart';
import '../../../../../core/di/main.di.dart';
import '../../models/post.model.dart';

class PostLocalDataSourceService extends ISecureStorageDataSource<PostModel> {
  PostLocalDataSourceService()
    : super(
        modelKey: 'app_post',
        secureStorageService: sl<SecureStorageService>(),
      );

  @override
  PostModel copyWith(PostModel existingItem, PostModel newValue) {
    return existingItem.copyWith(
      body: newValue.body ?? existingItem.body,
      id: newValue.id,
      title: newValue.title,
      userId: newValue.userId,
    );
  }

  @override
  PostModel? defaultValue() {
    return null;
  }

  @override
  PostModel fromJson(String json) {
    return PostModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(PostModel object) {
    return jsonEncode(object.toJson());
  }
}

class PostLocalDataSource {
  PostLocalDataSource(this._service);

  final PostLocalDataSourceService _service;

  Future<Either<AppErrorModel, List<PostModel>>> getAllPost() async {
    return _service.read();
  }

  Future<Either<AppErrorModel, PostModel>> getPost({required String id}) async {
    throw UnimplementedError();
  }

  Future<Either<AppErrorModel, bool>> deletePost({required String id}) async {
    throw UnimplementedError();
  }

  Future<Either<AppErrorModel, PostModel>> updatePost({
    required PostModel post,
  }) async {
    throw UnimplementedError();
  }

  Future<Either<AppErrorModel, PostModel>> addPost({
    required PostModel post,
  }) async {
    throw UnimplementedError();
  }
}
