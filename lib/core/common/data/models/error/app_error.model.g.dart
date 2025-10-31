// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppErrorModel _$AppErrorModelFromJson(Map<String, dynamic> json) =>
    _AppErrorModel(
      message: json['message'] as String,
      code: json['code'] as String?,
      data: json['data'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$AppErrorModelToJson(_AppErrorModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
      'path': instance.path,
    };
