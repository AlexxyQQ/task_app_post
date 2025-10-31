import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../../config/constants/gen/locale_keys.g.dart';

class ConnectivityInterceptor extends Interceptor {
  const ConnectivityInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionError) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: Response(
            requestOptions: err.requestOptions,
            statusCode: 503,
            statusMessage: LocaleKeys.common_errors_noInternetConnection.tr(),
            data: {
              'message': LocaleKeys.common_errors_noInternetConnection.tr(),
            },
          ),
        ),
      );
    }
    super.onError(err, handler);
  }
}
