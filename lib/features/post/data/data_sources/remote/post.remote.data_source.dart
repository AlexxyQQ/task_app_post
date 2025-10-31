import 'package:fpdart/fpdart.dart';

import '../../../../../core/common/data/models/error/app_error.model.dart';
import '../../../../../core/common/domain/services/api/dio.service.dart';
import '../../models/post.model.dart';

class PostRemoteDataSource {
  PostRemoteDataSource();

  Future<Either<AppErrorModel, List<PostModel>>> getAllPost() async {
    return ApiHandler.get(
      url: '/posts',
      onSuccess: (response) {
        return (response['data'] as List)
            .map((e) => PostModel.fromJson(e))
            .toList();
      },
    );
  }

  Future<Either<AppErrorModel, PostModel>> getPost({required String id}) async {
    return ApiHandler.get(
      url: '/posts/$id',
      onSuccess: (response) {
        return PostModel.fromJson(response);
      },
    );
  }

  Future<Either<AppErrorModel, bool>> deletePost({required String id}) async {
    return ApiHandler.delete(
      url: '/posts/$id',
      onSuccess: (response) {
        return true;
      },
    );
  }

  Future<Either<AppErrorModel, PostModel>> updatePost({
    required PostModel post,
  }) async {
    return ApiHandler.put(
      url: '/posts/${post.id}',
      data: post.toJson(),
      onSuccess: (response) {
        return PostModel.fromJson(response);
      },
    );
  }

  Future<Either<AppErrorModel, PostModel>> addPost({
    required PostModel post,
  }) async {
    return ApiHandler.post(
      url: '/posts/${post.id}',
      data: post.toJson(),
      onSuccess: (response) {
        return PostModel.fromJson(response);
      },
    );
  }
}
