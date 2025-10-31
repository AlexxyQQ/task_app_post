import 'dart:convert';

import '../../../../../core/abstract/data/data_source/abstract.secure_storage.data_source.dart';
import '../../../../../core/common/domain/services/storage/secure_storage.service.dart';
import '../../../../../core/di/main.di.dart';
import '../../models/setting/app_setting.model.dart';

class AppSettingLocalDataSource
    extends ISecureStorageDataSource<AppSettingModel> {
  AppSettingLocalDataSource()
    : super(
        modelKey: 'app_setting',
        secureStorageService: sl<SecureStorageService>(),
      );

  @override
  AppSettingModel fromJson(String json) {
    return AppSettingModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(object) {
    return jsonEncode(object.toJson());
  }

  @override
  AppSettingModel? defaultValue() {
    return const AppSettingModel();
  }

  @override
  AppSettingModel copyWith(
    AppSettingModel existingItem,
    AppSettingModel newValue,
  ) {
    return existingItem.copyWith(
      isDarkMode: newValue.isDarkMode,
      isNotificationOn: newValue.isNotificationOn,
      hasOnboarded: newValue.hasOnboarded,
      token: newValue.token ?? existingItem.token,
      backupLocation: newValue.backupLocation ?? existingItem.backupLocation,
    );
  }
}
