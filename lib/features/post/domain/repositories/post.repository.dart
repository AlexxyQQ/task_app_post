import 'package:fpdart/fpdart.dart';

import '../../../../core/common/data/models/error/app_error.model.dart';
import '../../data/models/post.model.dart';

abstract class IPostRepository {
  Future<Either<AppErrorModel, List<PostModel>>> getAllPost({
    bool apiFetch = true,
  });
  Future<Either<AppErrorModel, PostModel>> getPost({required String id});
  Future<Either<AppErrorModel, PostModel>> addPost({required PostModel post});
  Future<Either<AppErrorModel, PostModel>> updatePost({
    required PostModel post,
  });
  Future<Either<AppErrorModel, bool>> deletePost({required String id});
}
