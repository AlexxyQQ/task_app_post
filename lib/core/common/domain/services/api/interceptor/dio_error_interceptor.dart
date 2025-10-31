import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../config/constants/gen/locale_keys.g.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage;
    DioExceptionType errorType;

    if (err.response != null) {
      if (err.response!.statusCode! >= 400) {
        errorMessage = LocaleKeys.common_errors_serverError.tr();
        errorType = DioExceptionType.badResponse;
      } else if (err.response!.statusCode! >= 200 &&
          err.response!.statusCode! < 400) {
        errorMessage = LocaleKeys.common_errors_somethingWentWrong.tr();
        errorType = DioExceptionType.badResponse;
      } else {
        errorMessage = LocaleKeys.common_errors_somethingWentWrong.tr();
        errorType = DioExceptionType.badResponse;
      }
    } else {
      errorMessage = LocaleKeys.common_errors_noInternetConnection.tr();
      errorType = DioExceptionType.connectionError;
    }

    super.onError(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        error: errorMessage,
        type: errorType,
      ),
      handler,
    );
  }
}
