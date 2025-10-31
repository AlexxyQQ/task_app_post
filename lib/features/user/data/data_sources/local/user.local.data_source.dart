import 'dart:convert';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/abstract/data/data_source/abstract.secure_storage.data_source.dart';
import '../../../../../core/common/data/models/error/app_error.model.dart';
import '../../../../../core/common/domain/services/storage/secure_storage.service.dart';
import '../../../../../core/di/main.di.dart';
import '../../models/user.model.dart';

class UserLocalDataSource extends ISecureStorageDataSource<UserModel> {
  UserLocalDataSource()
    : super(
        modelKey: 'app_user',
        secureStorageService: sl<SecureStorageService>(),
      );

  @override
  UserModel copyWith(UserModel existingItem, UserModel newValue) {
    return existingItem.copyWith(
      id: newValue.id,
      email: newValue.email ?? existingItem.email,
      fullName: newValue.fullName ?? existingItem.fullName,
      phone: newValue.phone ?? existingItem.phone,
      address: newValue.address ?? existingItem.address,
      image: newValue.image ?? existingItem.image,
      username: newValue.username ?? existingItem.username,
    );
  }

  @override
  UserModel? defaultValue() {
    return null;
  }

  @override
  UserModel fromJson(String json) {
    return UserModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(UserModel object) {
    return jsonEncode(object.toJson());
  }
}
