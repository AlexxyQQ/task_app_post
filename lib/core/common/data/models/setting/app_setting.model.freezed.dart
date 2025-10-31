// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettingModel {

 bool get isDarkMode; bool get isNotificationOn; bool get hasOnboarded; dynamic? get user; String? get token; String? get backupLocation;
/// Create a copy of AppSettingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingModelCopyWith<AppSettingModel> get copyWith => _$AppSettingModelCopyWithImpl<AppSettingModel>(this as AppSettingModel, _$identity);

  /// Serializes this AppSettingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingModel&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode)&&(identical(other.isNotificationOn, isNotificationOn) || other.isNotificationOn == isNotificationOn)&&(identical(other.hasOnboarded, hasOnboarded) || other.hasOnboarded == hasOnboarded)&&const DeepCollectionEquality().equals(other.user, user)&&(identical(other.token, token) || other.token == token)&&(identical(other.backupLocation, backupLocation) || other.backupLocation == backupLocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDarkMode,isNotificationOn,hasOnboarded,const DeepCollectionEquality().hash(user),token,backupLocation);

@override
String toString() {
  return 'AppSettingModel(isDarkMode: $isDarkMode, isNotificationOn: $isNotificationOn, hasOnboarded: $hasOnboarded, user: $user, token: $token, backupLocation: $backupLocation)';
}


}

/// @nodoc
abstract mixin class $AppSettingModelCopyWith<$Res>  {
  factory $AppSettingModelCopyWith(AppSettingModel value, $Res Function(AppSettingModel) _then) = _$AppSettingModelCopyWithImpl;
@useResult
$Res call({
 bool isDarkMode, bool isNotificationOn, bool hasOnboarded, dynamic? user, String? token, String? backupLocation
});




}
/// @nodoc
class _$AppSettingModelCopyWithImpl<$Res>
    implements $AppSettingModelCopyWith<$Res> {
  _$AppSettingModelCopyWithImpl(this._self, this._then);

  final AppSettingModel _self;
  final $Res Function(AppSettingModel) _then;

/// Create a copy of AppSettingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDarkMode = null,Object? isNotificationOn = null,Object? hasOnboarded = null,Object? user = freezed,Object? token = freezed,Object? backupLocation = freezed,}) {
  return _then(_self.copyWith(
isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,isNotificationOn: null == isNotificationOn ? _self.isNotificationOn : isNotificationOn // ignore: cast_nullable_to_non_nullable
as bool,hasOnboarded: null == hasOnboarded ? _self.hasOnboarded : hasOnboarded // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as dynamic?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,backupLocation: freezed == backupLocation ? _self.backupLocation : backupLocation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingModel].
extension AppSettingModelPatterns on AppSettingModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingModel value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDarkMode,  bool isNotificationOn,  bool hasOnboarded,  dynamic? user,  String? token,  String? backupLocation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingModel() when $default != null:
return $default(_that.isDarkMode,_that.isNotificationOn,_that.hasOnboarded,_that.user,_that.token,_that.backupLocation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDarkMode,  bool isNotificationOn,  bool hasOnboarded,  dynamic? user,  String? token,  String? backupLocation)  $default,) {final _that = this;
switch (_that) {
case _AppSettingModel():
return $default(_that.isDarkMode,_that.isNotificationOn,_that.hasOnboarded,_that.user,_that.token,_that.backupLocation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDarkMode,  bool isNotificationOn,  bool hasOnboarded,  dynamic? user,  String? token,  String? backupLocation)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingModel() when $default != null:
return $default(_that.isDarkMode,_that.isNotificationOn,_that.hasOnboarded,_that.user,_that.token,_that.backupLocation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettingModel implements AppSettingModel {
  const _AppSettingModel({this.isDarkMode = false, this.isNotificationOn = true, this.hasOnboarded = false, this.user, this.token, this.backupLocation});
  factory _AppSettingModel.fromJson(Map<String, dynamic> json) => _$AppSettingModelFromJson(json);

@override@JsonKey() final  bool isDarkMode;
@override@JsonKey() final  bool isNotificationOn;
@override@JsonKey() final  bool hasOnboarded;
@override final  dynamic? user;
@override final  String? token;
@override final  String? backupLocation;

/// Create a copy of AppSettingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingModelCopyWith<_AppSettingModel> get copyWith => __$AppSettingModelCopyWithImpl<_AppSettingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingModel&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode)&&(identical(other.isNotificationOn, isNotificationOn) || other.isNotificationOn == isNotificationOn)&&(identical(other.hasOnboarded, hasOnboarded) || other.hasOnboarded == hasOnboarded)&&const DeepCollectionEquality().equals(other.user, user)&&(identical(other.token, token) || other.token == token)&&(identical(other.backupLocation, backupLocation) || other.backupLocation == backupLocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDarkMode,isNotificationOn,hasOnboarded,const DeepCollectionEquality().hash(user),token,backupLocation);

@override
String toString() {
  return 'AppSettingModel(isDarkMode: $isDarkMode, isNotificationOn: $isNotificationOn, hasOnboarded: $hasOnboarded, user: $user, token: $token, backupLocation: $backupLocation)';
}


}

/// @nodoc
abstract mixin class _$AppSettingModelCopyWith<$Res> implements $AppSettingModelCopyWith<$Res> {
  factory _$AppSettingModelCopyWith(_AppSettingModel value, $Res Function(_AppSettingModel) _then) = __$AppSettingModelCopyWithImpl;
@override @useResult
$Res call({
 bool isDarkMode, bool isNotificationOn, bool hasOnboarded, dynamic? user, String? token, String? backupLocation
});




}
/// @nodoc
class __$AppSettingModelCopyWithImpl<$Res>
    implements _$AppSettingModelCopyWith<$Res> {
  __$AppSettingModelCopyWithImpl(this._self, this._then);

  final _AppSettingModel _self;
  final $Res Function(_AppSettingModel) _then;

/// Create a copy of AppSettingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDarkMode = null,Object? isNotificationOn = null,Object? hasOnboarded = null,Object? user = freezed,Object? token = freezed,Object? backupLocation = freezed,}) {
  return _then(_AppSettingModel(
isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,isNotificationOn: null == isNotificationOn ? _self.isNotificationOn : isNotificationOn // ignore: cast_nullable_to_non_nullable
as bool,hasOnboarded: null == hasOnboarded ? _self.hasOnboarded : hasOnboarded // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as dynamic?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,backupLocation: freezed == backupLocation ? _self.backupLocation : backupLocation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
