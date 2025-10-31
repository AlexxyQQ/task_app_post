import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_setting.model.freezed.dart';
part 'app_setting.model.g.dart';

@freezed
abstract class AppSettingModel with _$AppSettingModel {
  const factory AppSettingModel({
    @Default(false) bool isDarkMode,
    @Default(true) bool isNotificationOn,
    @Default(false) bool hasOnboarded,
    dynamic? user,
    String? token,
    String? backupLocation,
  }) = _AppSettingModel;

  factory AppSettingModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingModelFromJson(json);
}
