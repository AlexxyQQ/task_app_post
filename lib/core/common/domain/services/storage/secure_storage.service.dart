import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  /// {@macro secure_storage}
  SecureStorageService([FlutterSecureStorage? secureStorage])
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  Future<String?> read({required String key}) async {
    try {
      return await _secureStorage.read(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> write({required String key, required String value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll();
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
