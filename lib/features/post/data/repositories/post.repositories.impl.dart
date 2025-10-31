import 'package:fpdart/fpdart.dart';

import '../../../../core/common/data/models/error/app_error.model.dart';
import '../../../../core/di/main.di.dart';
import '../../domain/repositories/post.repository.dart';
import '../data_sources/local/post.local.data_source.dart';
import '../data_sources/remote/post.remote.data_source.dart';
import '../models/post.model.dart';

class PostRepositoryImpl implements IPostRepository {
  PostRepositoryImpl({
    required PostRemoteDataSource remoteDataSource,
    required PostLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;
  final PostRemoteDataSource _remoteDataSource;
  final PostLocalDataSource _localDataSource;

  @override
  Future<Either<AppErrorModel, List<PostModel>>> getAllPost({
    bool apiFetch = true,
  }) async {
    if (apiFetch) {
      final data = await _remoteDataSource.getAllPost();
      return data.fold(
        (l) {
          return Left(l);
        },
        (r) {
          sl<PostLocalDataSourceService>().createMultiple(values: r);
          return Right(r);
        },
      );
    } else {
      return _localDataSource.getAllPost();
    }
  }

  @override
  Future<Either<AppErrorModel, PostModel>> getPost({required String id}) {
    return _remoteDataSource.getPost(id: id);
  }

  @override
  Future<Either<AppErrorModel, PostModel>> addPost({required PostModel post}) {
    return _remoteDataSource.addPost(post: post);
  }

  @override
  Future<Either<AppErrorModel, bool>> deletePost({required String id}) {
    return _remoteDataSource.deletePost(id: id);
  }

  @override
  Future<Either<AppErrorModel, PostModel>> updatePost({
    required PostModel post,
  }) {
    return _remoteDataSource.updatePost(post: post);
  }
}
