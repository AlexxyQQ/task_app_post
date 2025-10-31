import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.model.freezed.dart';
part 'post.model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  const PostModel._();

  const factory PostModel({
    required int userId,
    required int id,
    required String title,
    String? body,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
