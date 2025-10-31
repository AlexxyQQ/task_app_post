import 'package:uuid/uuid.dart';

/// A singleton helper class for generating default values for model properties,
/// particularly useful when creating models from JSON where certain fields might be missing.
///
/// This class provides static methods to generate UUIDs and timestamps, ensuring
/// that model instances always have valid values for fields like `id`, `createdAt`,
/// and `updatedAt`. It's designed to be used with code-generation libraries
/// like `freezed` and `json_serializable`.
///
/// ### Example with `freezed`
///
/// You can use `ModelGeneratorHelper` with the `@JsonKey` annotation to provide
/// default values for missing fields directly in your model. This is the recommended
/// approach as it's clean and declarative.
///
/// ```dart
/// import 'package:freezed_annotation/freezed_annotation.dart';
/// // Make sure to import the helper file
/// import 'package:your_app/model_generator_helper.dart';
///
/// part 'user.model.freezed.dart';
/// part 'user.model.g.dart';
///
/// @freezed
/// class User with _$User {
///   @JsonSerializable(fieldRename: FieldRename.snake)
///   const factory User({
///     @JsonKey(fromJson: ModelGeneratorHelper.generateUuidFromJson)
///     required String id,
///
///     @JsonKey(fromJson: ModelGeneratorHelper.generateCreatedAtFromJson)
///     required DateTime createdAt,
///
///     @JsonKey(fromJson: ModelGeneratorHelper.generateUpdatedAtFromJson)
///     required DateTime updatedAt,
///
///     required String name,
///   }) = _User;
///
///   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
/// }
///
/// void main() {
///   // Case 1: JSON with all fields present
///   final jsonWithData = {
///     'id': 'existing-uuid-123',
///     'created_at': '2023-01-01T12:00:00.000Z',
///     'updated_at': '2023-01-02T12:00:00.000Z',
///     'name': 'Alice',
///   };
///   final user1 = User.fromJson(jsonWithData);
///   print('User 1 ID: ${user1.id}'); // Outputs: User 1 ID: existing-uuid-123
///   print('User 1 Created At: ${user1.createdAt}'); // Outputs: 2023-01-01 12:00:00.000Z
///
///   // Case 2: JSON with missing id, createdAt, and updatedAt
///   final jsonWithoutData = {
///     'name': 'Bob',
///   };
///   final user2 = User.fromJson(jsonWithoutData);
///   // Outputs a newly generated v4 UUID, e.g., '123e4567-e89b-12d3-a456-426614174000'
///   print('User 2 ID: ${user2.id}');
///   // Outputs the current DateTime when the object was created
///   print('User 2 Created At: ${user2.createdAt}');
/// }
/// ```
class ModelGeneratorHelper {
  ModelGeneratorHelper._();
  static final ModelGeneratorHelper _instance = ModelGeneratorHelper._();
  static ModelGeneratorHelper get instance => _instance;

  /// Returns the provided `id` if it's not null, otherwise generates a new v4 UUID.
  ///
  /// This function is suitable for `fromJson` in a `@JsonKey` annotation.
  static String generateUuidFromJson(dynamic id) {
    if (id is String && id.isNotEmpty) {
      return id;
    }
    const uuid = Uuid();
    return uuid.v4();
  }

  /// Returns a `DateTime` parsed from the `createdAt` string if it's not null,
  /// otherwise returns the current UTC time.
  ///
  /// This function is suitable for `fromJson` in a `@JsonKey` annotation.
  static DateTime generateCreatedAtFromJson(dynamic createdAt) {
    if (createdAt is String && createdAt.isNotEmpty) {
      return DateTime.parse(createdAt);
    }
    return DateTime.now().toUtc();
  }

  /// Returns a `DateTime` parsed from the `updatedAt` string if it's not null,
  /// otherwise returns the current UTC time.
  ///
  /// This function is suitable for `fromJson` in a `@JsonKey` annotation.
  static DateTime generateUpdatedAtFromJson(dynamic updatedAt) {
    if (updatedAt is String && updatedAt.isNotEmpty) {
      return DateTime.parse(updatedAt);
    }
    return DateTime.now().toUtc();
  }
}
