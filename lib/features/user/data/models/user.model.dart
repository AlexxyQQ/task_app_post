import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/common/data/models/helpers/model_generator.helper.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel({
    @JsonKey(fromJson: ModelGeneratorHelper.generateUuidFromJson)
    required String id,
    String? username,
    String? email,
    String? phone,
    String? address,
    String? image,
    String? fullName,
    @JsonKey(fromJson: ModelGeneratorHelper.generateCreatedAtFromJson)
    DateTime? createdAt,
    @JsonKey(fromJson: ModelGeneratorHelper.generateUpdatedAtFromJson)
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
