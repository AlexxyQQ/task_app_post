import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../config/constants/api/api.constants.dart';
import '../../../../../config/constants/gen/locale_keys.g.dart';
import '../../../../di/main.di.dart';
import '../../../data/models/error/app_error.model.dart';
import 'interceptor/connectivity_interceptor.dart';
import 'interceptor/dio_error_interceptor.dart';

class DioService {
  DioService() {
    _dio
      ..options.baseUrl = ApiConstants.baseAPIURL
      ..options.receiveTimeout = ApiConstants.receiveTimeout
      ..options.connectTimeout = ApiConstants.connectTimeout
      // Adding a custom error interceptor for enhanced error handling.
      ..interceptors.add(DioErrorInterceptor())
      ..interceptors.add(const ConnectivityInterceptor());

    // if (kDebugMode) {
    //   _dio.interceptors.add(MockerInterceptor());
    // }
  }
  final Dio _dio = Dio();

  // change the base URL
  void setBaseURL(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  Dio get dio => _dio;
}

/// A static utility class for handling API requests using Dio.
///
/// This class provides a simplified and consistent interface for making GET, POST,
/// PUT, and DELETE requests. It abstracts the underlying Dio calls and integrates
/// a robust error handling mechanism, returning results wrapped in an `Either` type
/// from the `fpdart` package.
///
/// ## Features
/// - **Type-Safe Responses**: Uses generics (`<T>`) to return strongly typed success objects.
/// - **Unified Error Handling**: Catches `DioException` and other exceptions, converting them
///   into a standardized `AppErrorModel`.
/// - **Clear Success/Failure Path**: Returns `Either<AppErrorModel, T>`, forcing the
///   caller to handle both success (Right) and failure (Left) states explicitly.
/// - **Simplified API Calls**: Provides static methods (`get`, `post`, `put`, `delete`) that
///   reduce boilerplate code in repositories or data sources.
///
/// ## Example Usage
///
/// First, define a model for the data you expect from the API.
///
/// ```dart
/// // 1. Define your data model
/// class User {
///   final int id;
///   final String name;
///   final String email;
///
///   User({required this.id, required this.name, required this.email});
///
///   factory User.fromJson(Map<String, dynamic> json) {
///     return User(
///       id: json['id'] as int,
///       name: json['name'] as String,
///       email: json['email'] as String,
///     );
///   }
/// }
/// ```
///
/// Next, use the `ApiHandler` in your repository or service to fetch or post data.
///
/// ```dart
/// class UserRepository {
///   // Example of a GET request to fetch a user
///   Future<Either<AppErrorModel, User>> getUser(int userId) async {
///     final result = await ApiHandler.get<User>(
///       url: '/users/$userId',
///       onSuccess: (json) {
///         // This callback is executed on a successful response (e.g., status code 200).
///         // It receives the JSON response body and must return the parsed model.
///         return User.fromJson(json);
///       },
///     );
///     return result;
///   }
///
///   // Example of a POST request to create a user
///   Future<Either<AppErrorModel, User>> createUser(String name, String email) async {
///     final result = await ApiHandler.post<User>(
///       url: '/users',
///       data: {'name': name, 'email': email},
///       onSuccess: (json) {
///         // onSuccess for POST usually handles the response body of the created resource.
///         return User.fromJson(json);
///       },
///       // Optional: Customize success code for POST (e.g., 201 Created)
///       successCode: 201,
///     );
///     return result;
///   }
/// }
/// ```
///
/// Finally, in your application logic (e.g., a BLoC, Cubit, or ViewModel),
/// you can call the repository method and handle the `Either` result.
///
/// ```dart
/// void main() async {
///   final userRepository = UserRepository();
///
///   // Fetch a user and handle the result
///   final userResult = await userRepository.getUser(1);
///
///   userResult.fold(
///     (appError) {
///       // This is the failure (Left) case.
///       print('Failed to fetch user: ${appError.message}');
///     },
///     (user) {
///       // This is the success (Right) case.
///       print('Successfully fetched user: ${user.name}');
///     },
///   );
///
///   // Create a new user and handle the result
///   final newUserResult = await userRepository.createUser('John Doe', 'john.doe@example.com');
///
///   newUserResult.fold(
///     (appError) {
///       print('Failed to create user: ${appError.message}');
///     },
///     (newUser) {
///       print('Successfully created user with ID: ${newUser.id}');
///     },
///   );
/// }
/// ```
class ApiHandler {
  static Future<Either<AppErrorModel, T>> _call<T>(
    Future<Response<Map<String, dynamic>>> Function() apiCall, {
    required T Function(Map<String, dynamic>) onSuccess,
    AppErrorModel Function(Map<String, dynamic>)? onError,
    AppErrorModel defaultErrorMessage = const AppErrorModel(
      message: LocaleKeys.common_errors_somethingWentWrong,
    ),
    int? successCode = 200,
    String? successMessage = 'OK',
  }) async {
    try {
      final response = await apiCall();
      if (response.statusCode == successCode ||
          response.statusMessage == 'OK') {
        if (response.data == null) {
          return const Left(
            AppErrorModel(message: LocaleKeys.common_errors_somethingWentWrong),
          );
        }
        return Right(onSuccess.call(response.data ?? {}));
      } else {
        return Left(onError?.call(response.data ?? {}) ?? defaultErrorMessage);
      }
    } on DioException catch (e) {
      onError?.call(e.response?.data ?? {});
      return Left(AppErrorModel.fromDioException(e));
    } catch (e) {
      onError?.call({'message': e.toString()});
      return Left(AppErrorModel(message: e.toString()));
    }
  }

  static Future<Either<AppErrorModel, T>> get<T>({
    required String url,
    required T Function(Map<String, dynamic>) onSuccess,
    Map<String, dynamic>? queryParams,
    AppErrorModel Function(Map<String, dynamic>)? onError,
    AppErrorModel defaultErrorMessage = const AppErrorModel(
      message: LocaleKeys.common_errors_somethingWentWrong,
    ),
    int? successCode = 200,
    String? successMessage = 'OK',
  }) async {
    return _call<T>(
      () => sl<DioService>().dio.get(url, queryParameters: queryParams),
      onSuccess: onSuccess,
      defaultErrorMessage: defaultErrorMessage,
      onError: onError,
      successCode: successCode,
      successMessage: successMessage,
    );
  }

  static Future<Either<AppErrorModel, T>> post<T>({
    required String url,
    required T Function(Map<String, dynamic>) onSuccess,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    AppErrorModel Function(Map<String, dynamic>)? onError,
    AppErrorModel defaultErrorMessage = const AppErrorModel(
      message: LocaleKeys.common_errors_somethingWentWrong,
    ),
    int? successCode = 201,
    String? successMessage = 'OK',
  }) async {
    return _call<T>(
      () => sl<DioService>().dio.post(
        url,
        queryParameters: queryParams,
        data: data,
      ),
      onSuccess: onSuccess,
      defaultErrorMessage: defaultErrorMessage,
      onError: onError,
      successCode: successCode,
      successMessage: successMessage,
    );
  }

  static Future<Either<AppErrorModel, T>> put<T>({
    required String url,
    required T Function(Map<String, dynamic>) onSuccess,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    AppErrorModel Function(Map<String, dynamic>)? onError,
    AppErrorModel defaultErrorMessage = const AppErrorModel(
      message: LocaleKeys.common_errors_somethingWentWrong,
    ),
    int? successCode = 200,
    String? successMessage = 'OK',
  }) async {
    return _call<T>(
      () => sl<DioService>().dio.put(
        url,
        queryParameters: queryParams,
        data: data,
      ),
      onSuccess: onSuccess,
      defaultErrorMessage: defaultErrorMessage,
      onError: onError,
      successCode: successCode,
      successMessage: successMessage,
    );
  }

  static Future<Either<AppErrorModel, T>> delete<T>({
    required String url,
    required T Function(Map<String, dynamic>) onSuccess,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    AppErrorModel Function(Map<String, dynamic>)? onError,
    AppErrorModel defaultErrorMessage = const AppErrorModel(
      message: LocaleKeys.common_errors_somethingWentWrong,
    ),
    int? successCode = 200,
    String? successMessage = 'OK',
  }) async {
    return _call<T>(
      () => sl<DioService>().dio.delete(
        url,
        queryParameters: queryParams,
        data: data,
      ),
      onSuccess: onSuccess,
      defaultErrorMessage: defaultErrorMessage,
      onError: onError,
      successCode: successCode,
      successMessage: successMessage,
    );
  }
}
