import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../config/constants/gen/locale_keys.g.dart';

part 'app_error.model.freezed.dart';
part 'app_error.model.g.dart';

@freezed
abstract class AppErrorModel with _$AppErrorModel {
  const factory AppErrorModel({
    required String message,
    String? code,
    String? data,
    String? path,
    @JsonKey(includeToJson: false, includeFromJson: false)
    // This stops the json serialization from including this field
    PageRouteInfo<Object?>? navigateRoute,
  }) = _AppErrorModel;

  factory AppErrorModel.fromDioException(DioException e) {
    String errorMessage = LocaleKeys.common_errors_somethingWentWrong.tr();
    try {
      if (e.response?.data is String) {
        errorMessage = e.response?.data ?? errorMessage;
      } else if (e.response?.data is Map<String, dynamic>) {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
    } catch (error) {
      return AppErrorModel(
        message: errorMessage,
        code: e.response?.statusCode.toString(),
        data: e.message,
      );
    }
    return AppErrorModel(
      message: errorMessage,
      code: e.response?.statusCode.toString(),
      data: e.message,
    );
  }
  factory AppErrorModel.fromException(dynamic e) {
    return AppErrorModel(message: e.toString());
  }

  factory AppErrorModel.fromJson(Map<String, dynamic> json) =>
      _$AppErrorModelFromJson(json);
}
