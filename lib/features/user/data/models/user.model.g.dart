// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: ModelGeneratorHelper.generateUuidFromJson(json['id']),
  username: json['username'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  image: json['image'] as String?,
  fullName: json['full_name'] as String?,
  createdAt: ModelGeneratorHelper.generateCreatedAtFromJson(json['created_at']),
  updatedAt: ModelGeneratorHelper.generateUpdatedAtFromJson(json['updated_at']),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'image': instance.image,
      'full_name': instance.fullName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
