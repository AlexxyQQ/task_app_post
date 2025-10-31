import 'dart:convert';

import 'package:easy_localization/easy_localization.dart'; // Add this import for the  extension method
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../config/constants/gen/locale_keys.g.dart';
import '../../../common/data/models/error/app_error.model.dart';
import '../../../common/domain/services/storage/secure_storage.service.dart';

abstract class ISecureStorageDataSource<T> {
  ISecureStorageDataSource({
    required this.secureStorageService,
    required this.modelKey,
    this.seedAssetPath,
  });
  final SecureStorageService secureStorageService;
  final String? seedAssetPath;
  final String modelKey;

  /// Serialize the object to JSON string
  /// Override this method in concrete implementations
  String toJson(T object);

  /// Deserialize JSON string to object
  /// Override this method in concrete implementations
  T fromJson(String json);

  // CopyWith Function to copy the object with new values
  T copyWith(T existingItem, T newValue);

  T? defaultValue();

  /// Serialize list to JSON string
  String listToJson(List<T> list) {
    return jsonEncode(list.map((item) => jsonDecode(toJson(item))).toList());
  }

  /// Deserialize JSON string to list
  List<T> listFromJson(String json) {
    final List<dynamic> jsonList = jsonDecode(json);
    return jsonList.map((item) => fromJson(jsonEncode(item))).toList();
  }

  /// Create operation - adds a new value to the existing list
  Future<Either<AppErrorModel, List<T>>> create({required T value}) async {
    try {
      final existingList = await read();
      // Check if the value already exists
      return existingList.fold((l) => Left(l), (r) async {
        if (r.contains(value)) {
          return const Left(
            AppErrorModel(
              message: LocaleKeys
                  .core_abstract_data_sources_secure_storage_itemAlreadyExists,
            ),
          );
        }
        r.add(value);
        final jsonString = listToJson(r);
        await secureStorageService.write(key: modelKey, value: jsonString);
        final newData = listFromJson(jsonString);
        return Right(newData);
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_createFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Create multiple - adds multiple values to the existing list
  Future<Either<AppErrorModel, List<T>>> createMultiple({
    required List<T> values,
  }) async {
    try {
      final existingListResult = await read();

      return existingListResult.fold((error) => Left(error), (
        existingList,
      ) async {
        final List<T> cleanedValues = List.from(values);
        // Check if the value already exists
        for (var item in values) {
          if (existingList.contains(item)) {
            cleanedValues.remove(item);
          }
        }

        if (cleanedValues.isEmpty) {
          return Right(existingList);
        }

        existingList.addAll(cleanedValues);
        final jsonString = listToJson(existingList);
        await secureStorageService.write(key: modelKey, value: jsonString);
        return Right(existingList);
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_createMultipleFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Read operation - retrieves the list
  Future<Either<AppErrorModel, List<T>>> read() async {
    try {
      final jsonString = await secureStorageService.read(key: modelKey);
      // ignore: prefer_const_constructors
      if (jsonString == null) {
        if (defaultValue() == null) {
          return Right(<T>[]);
        } else {
          return Right(<T>[defaultValue() as T]);
        }
      }
      return Right(listFromJson(jsonString));
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_readFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Update operation - replaces the entire list with new values
  Future<Either<AppErrorModel, List<T>>> update({
    required List<T> values,
  }) async {
    try {
      final jsonString = listToJson(values);
      await secureStorageService.write(key: modelKey, value: jsonString);
      return Right(listFromJson(jsonString));
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_updateFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Update single item by index - preserves all other items in the list
  Future<Either<AppErrorModel, List<T>>> updateByIndex({
    required int index,
    required T value,
  }) async {
    try {
      final existingListResult = await read();

      return existingListResult.fold((error) => Left(error), (
        existingList,
      ) async {
        if (index < 0 || index >= existingList.length) {
          return Left(
            AppErrorModel(
              message: LocaleKeys
                  .core_abstract_data_sources_secure_storage_indexOutOfBounds
                  .tr(
                    namedArgs: {
                      'index': index.toString(),
                      'length': existingList.length.toString(),
                    },
                  ),
            ),
          );
        }

        final updatedItem = copyWith(existingList[index], value);
        // Check if the value already exists
        if (existingList.contains(updatedItem)) {
          return const Left(
            AppErrorModel(
              message: LocaleKeys
                  .core_abstract_data_sources_secure_storage_itemAlreadyExists,
            ),
          );
        }

        existingList[index] = updatedItem;
        final jsonString = listToJson(existingList);
        await secureStorageService.write(key: modelKey, value: jsonString);
        return Right(existingList);
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_updateByIndexFailed
              .tr(
                namedArgs: {
                  'index': index.toString(),
                  'modelKey': modelKey,
                  'error': e.toString(),
                },
              ),
        ),
      );
    }
  }

  /// Update first item that matches a condition - preserves all other items
  Future<Either<AppErrorModel, bool>> updateWhere({
    required bool Function(T) test,
    required T newValue,
  }) async {
    try {
      final existingListResult = await read();

      return existingListResult.fold((error) => Left(error), (
        existingList,
      ) async {
        final index = existingList.indexWhere(test);

        if (index == -1) {
          return const Right(false); // No item found matching the condition
        }

        final existingItem = existingList[index];
        final updatedItem = copyWith(existingItem, newValue);
        existingList[index] = updatedItem;

        final jsonString = listToJson(existingList);
        await secureStorageService.write(key: modelKey, value: jsonString);
        return const Right(true); // Item was updated successfully
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_updateWhereFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Update all items that match a condition - preserves non-matching items
  Future<Either<AppErrorModel, int>> updateAllWhere({
    required bool Function(T) test,
    required T Function(T) transform,
  }) async {
    try {
      final existingListResult = await read();

      return existingListResult.fold((error) => Left(error), (
        existingList,
      ) async {
        int updatedCount = 0;

        for (int i = 0; i < existingList.length; i++) {
          if (test(existingList[i])) {
            existingList[i] = transform(existingList[i]);
            updatedCount++;
          }
        }

        if (updatedCount > 0) {
          final jsonString = listToJson(existingList);
          await secureStorageService.write(key: modelKey, value: jsonString);
        }

        return Right(updatedCount);
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_updateAllWhereFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Upsert single item - adds if not exists, updates if exists based on condition
  Future<Either<AppErrorModel, bool>> upsertItem({
    required bool Function(T) test,
    required T value,
  }) async {
    try {
      final existingListResult = await read();

      return existingListResult.fold((error) => Left(error), (
        existingList,
      ) async {
        final index = existingList.indexWhere(test);

        if (index == -1) {
          // Item doesn't exist, add it
          existingList.add(value);
        } else {
          // Item exists, update it
          final updatedItem = copyWith(existingList[index], value);
          existingList[index] = updatedItem;
        }

        final jsonString = listToJson(existingList);
        await secureStorageService.write(key: modelKey, value: jsonString);
        return Right(
          index == -1,
        ); // Returns true if item was created, false if updated
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_upsertFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Delete operation - removes the entire list
  Future<Either<AppErrorModel, List<T>>> delete() async {
    try {
      await secureStorageService.delete(key: modelKey);
      final existingListResult = await read();
      return existingListResult.fold((l) => const Right([]), (r) => Right(r));
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_deleteFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Delete item by index
  Future<Either<AppErrorModel, List<T>>> deleteByIndex({
    required int index,
  }) async {
    try {
      final existingListResult = await read();

      return existingListResult.fold((error) => Left(error), (
        existingList,
      ) async {
        if (index < 0 || index >= existingList.length) {
          return Left(
            AppErrorModel(
              message: LocaleKeys
                  .core_abstract_data_sources_secure_storage_indexOutOfBounds
                  .tr(
                    namedArgs: {
                      'index': index.toString(),
                      'length': existingList.length.toString(),
                    },
                  ),
            ),
          );
        }

        existingList.removeAt(index);
        final jsonString = listToJson(existingList);
        await secureStorageService.write(key: modelKey, value: jsonString);
        return Right(existingList);
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_deleteByIndexFailed
              .tr(
                namedArgs: {
                  'index': index.toString(),
                  'modelKey': modelKey,
                  'error': e.toString(),
                },
              ),
        ),
      );
    }
  }

  /// Delete items that match a condition
  Future<Either<AppErrorModel, List<T>>> deleteWhere({
    required bool Function(T) test,
  }) async {
    try {
      final existingListResult = await read();

      return existingListResult.fold((error) => Left(error), (
        existingList,
      ) async {
        existingList.removeWhere(test);
        final jsonString = listToJson(existingList);
        await secureStorageService.write(key: modelKey, value: jsonString);
        return Right(existingList);
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_deleteWhereFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Clear operation - removes all stored values
  Future<Either<AppErrorModel, List<T>>> clear() async {
    try {
      await secureStorageService.clear();
      final existingListResult = await read();
      return existingListResult.fold((l) => const Right([]), (r) => Right(r));
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_clearFailed
              .tr(namedArgs: {'error': e.toString()}),
        ),
      );
    }
  }

  /// Check if a key exists in storage
  Future<Either<AppErrorModel, bool>> containsKey() async {
    try {
      final value = await secureStorageService.read(key: modelKey);
      return Right(value != null);
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_containsKeyFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Get count of items in the list
  Future<Either<AppErrorModel, int>> count() async {
    try {
      final listResult = await read();

      return listResult.fold(
        (error) => Left(error),
        (list) => Right(list.length),
      );
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_countFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Check if list is empty
  Future<Either<AppErrorModel, bool>> isEmpty() async {
    try {
      final listResult = await read();

      return listResult.fold(
        (error) => Left(error),
        (list) => Right(list.isEmpty),
      );
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_isEmptyFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Get all keys (Note: Limited by FlutterSecureStorage capabilities)
  Future<Either<AppErrorModel, Set<String>>> keys() async {
    return const Left(
      AppErrorModel(
        message: LocaleKeys
            .core_abstract_data_sources_secure_storage_keysNotSupported,
      ),
    );
  }

  /// Read with default value - returns default if key doesn't exist
  Future<Either<AppErrorModel, List<T>>> readOrDefault({
    required List<T> defaultValue,
  }) async {
    final valueResult = await read();

    return valueResult.fold(
      (error) => Right(defaultValue),
      (list) => Right(list.isEmpty ? defaultValue : list),
    );
  }

  /// Find items that match a condition
  Future<Either<AppErrorModel, List<T>>> where({
    required bool Function(T) test,
  }) async {
    try {
      final listResult = await read();

      return listResult.fold(
        (error) => Left(error),
        (list) => Right(list.where(test).toList()),
      );
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_whereFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Find first item that matches a condition
  Future<Either<AppErrorModel, T?>> firstWhere({
    required bool Function(T) test,
  }) async {
    try {
      final listResult = await read();

      return listResult.fold((error) => Left(error), (list) {
        try {
          return Right(list.firstWhere(test));
        } catch (e) {
          return const Right(null);
        }
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_firstWhereFailed
              .tr(namedArgs: {'modelKey': modelKey, 'error': e.toString()}),
        ),
      );
    }
  }

  /// Batch operations for multiple keys
  Future<Either<AppErrorModel, Map<String, List<T>>>> readMultiple({
    required List<String> keys,
  }) async {
    try {
      final Map<String, List<T>> results = {};

      for (final key in keys) {
        try {
          final jsonString = await secureStorageService.read(key: key);
          if (jsonString != null) {
            results[key] = listFromJson(jsonString);
          } else {
            results[key] = <T>[];
          }
        } catch (e) {
          results[key] = <T>[];
        }
      }

      return Right(results);
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_readMultipleFailed
              .tr(namedArgs: {'error': e.toString()}),
        ),
      );
    }
  }

  /// Write multiple key-value pairs (each value is a list)
  Future<Either<AppErrorModel, List<T>>> writeMultiple({
    required Map<String, List<T>> data,
  }) async {
    try {
      for (final entry in data.entries) {
        final jsonString = listToJson(entry.value);
        await secureStorageService.write(key: entry.key, value: jsonString);
      }
      final existingListResult = await read();
      return existingListResult.fold((l) => const Right([]), (r) => Right(r));
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_writeMultipleFailed
              .tr(namedArgs: {'error': e.toString()}),
        ),
      );
    }
  }

  // Seeder Function to seed the data source from JSON (assets with list of objects)
  Future<Either<AppErrorModel, List<T>>> seed() async {
    if (seedAssetPath == null) {
      return const Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_seedPathNotSet,
        ),
      );
    }

    try {
      final existingDataResult = await read();

      return existingDataResult.fold((error) => Left(error), (
        existingData,
      ) async {
        try {
          final data = await rootBundle.loadString(seedAssetPath!);
          final dataList = jsonDecode(data) as List<dynamic>;

          final List<T> seedItems = [];
          for (final item in dataList) {
            try {
              final value = fromJson(jsonEncode(item));
              if (!existingData.contains(value)) seedItems.add(value);
            } catch (e) {
              continue;
            }
          }

          if (seedItems.isEmpty) {
            return Right(existingData);
          }

          // Replace the entire list with seed data
          final updateResult = await update(values: seedItems);
          return updateResult.fold((error) => Left(error), (r) => Right(r));
        } catch (e) {
          return Left(
            AppErrorModel(
              message: LocaleKeys
                  .core_abstract_data_sources_secure_storage_seedFailed
                  .tr(namedArgs: {'error': e.toString()}),
            ),
          );
        }
      });
    } catch (e) {
      return Left(
        AppErrorModel(
          message: LocaleKeys
              .core_abstract_data_sources_secure_storage_seedFailed
              .tr(namedArgs: {'error': e.toString()}),
        ),
      );
    }
  }
}
