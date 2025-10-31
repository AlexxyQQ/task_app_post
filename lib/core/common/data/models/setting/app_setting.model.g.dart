// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettingModel _$AppSettingModelFromJson(Map<String, dynamic> json) =>
    _AppSettingModel(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      isNotificationOn: json['isNotificationOn'] as bool? ?? true,
      hasOnboarded: json['hasOnboarded'] as bool? ?? false,
      user: json['user'],
      token: json['token'] as String?,
      backupLocation: json['backupLocation'] as String?,
    );

Map<String, dynamic> _$AppSettingModelToJson(_AppSettingModel instance) =>
    <String, dynamic>{
      'isDarkMode': instance.isDarkMode,
      'isNotificationOn': instance.isNotificationOn,
      'hasOnboarded': instance.hasOnboarded,
      'user': instance.user,
      'token': instance.token,
      'backupLocation': instance.backupLocation,
    };
