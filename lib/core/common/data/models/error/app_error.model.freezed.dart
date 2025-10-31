// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppErrorModel {

 String get message; String? get code; String? get data; String? get path;@JsonKey(includeToJson: false, includeFromJson: false) PageRouteInfo<Object?>? get navigateRoute;
/// Create a copy of AppErrorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppErrorModelCopyWith<AppErrorModel> get copyWith => _$AppErrorModelCopyWithImpl<AppErrorModel>(this as AppErrorModel, _$identity);

  /// Serializes this AppErrorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppErrorModel&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.data, data) || other.data == data)&&(identical(other.path, path) || other.path == path)&&(identical(other.navigateRoute, navigateRoute) || other.navigateRoute == navigateRoute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,code,data,path,navigateRoute);

@override
String toString() {
  return 'AppErrorModel(message: $message, code: $code, data: $data, path: $path, navigateRoute: $navigateRoute)';
}


}

/// @nodoc
abstract mixin class $AppErrorModelCopyWith<$Res>  {
  factory $AppErrorModelCopyWith(AppErrorModel value, $Res Function(AppErrorModel) _then) = _$AppErrorModelCopyWithImpl;
@useResult
$Res call({
 String message, String? code, String? data, String? path,@JsonKey(includeToJson: false, includeFromJson: false) PageRouteInfo<Object?>? navigateRoute
});




}
/// @nodoc
class _$AppErrorModelCopyWithImpl<$Res>
    implements $AppErrorModelCopyWith<$Res> {
  _$AppErrorModelCopyWithImpl(this._self, this._then);

  final AppErrorModel _self;
  final $Res Function(AppErrorModel) _then;

/// Create a copy of AppErrorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? code = freezed,Object? data = freezed,Object? path = freezed,Object? navigateRoute = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,navigateRoute: freezed == navigateRoute ? _self.navigateRoute : navigateRoute // ignore: cast_nullable_to_non_nullable
as PageRouteInfo<Object?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppErrorModel].
extension AppErrorModelPatterns on AppErrorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppErrorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppErrorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppErrorModel value)  $default,){
final _that = this;
switch (_that) {
case _AppErrorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppErrorModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppErrorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  String? code,  String? data,  String? path, @JsonKey(includeToJson: false, includeFromJson: false)  PageRouteInfo<Object?>? navigateRoute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppErrorModel() when $default != null:
return $default(_that.message,_that.code,_that.data,_that.path,_that.navigateRoute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  String? code,  String? data,  String? path, @JsonKey(includeToJson: false, includeFromJson: false)  PageRouteInfo<Object?>? navigateRoute)  $default,) {final _that = this;
switch (_that) {
case _AppErrorModel():
return $default(_that.message,_that.code,_that.data,_that.path,_that.navigateRoute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  String? code,  String? data,  String? path, @JsonKey(includeToJson: false, includeFromJson: false)  PageRouteInfo<Object?>? navigateRoute)?  $default,) {final _that = this;
switch (_that) {
case _AppErrorModel() when $default != null:
return $default(_that.message,_that.code,_that.data,_that.path,_that.navigateRoute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppErrorModel implements AppErrorModel {
  const _AppErrorModel({required this.message, this.code, this.data, this.path, @JsonKey(includeToJson: false, includeFromJson: false) this.navigateRoute});
  factory _AppErrorModel.fromJson(Map<String, dynamic> json) => _$AppErrorModelFromJson(json);

@override final  String message;
@override final  String? code;
@override final  String? data;
@override final  String? path;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  PageRouteInfo<Object?>? navigateRoute;

/// Create a copy of AppErrorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppErrorModelCopyWith<_AppErrorModel> get copyWith => __$AppErrorModelCopyWithImpl<_AppErrorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppErrorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppErrorModel&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&(identical(other.data, data) || other.data == data)&&(identical(other.path, path) || other.path == path)&&(identical(other.navigateRoute, navigateRoute) || other.navigateRoute == navigateRoute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,code,data,path,navigateRoute);

@override
String toString() {
  return 'AppErrorModel(message: $message, code: $code, data: $data, path: $path, navigateRoute: $navigateRoute)';
}


}

/// @nodoc
abstract mixin class _$AppErrorModelCopyWith<$Res> implements $AppErrorModelCopyWith<$Res> {
  factory _$AppErrorModelCopyWith(_AppErrorModel value, $Res Function(_AppErrorModel) _then) = __$AppErrorModelCopyWithImpl;
@override @useResult
$Res call({
 String message, String? code, String? data, String? path,@JsonKey(includeToJson: false, includeFromJson: false) PageRouteInfo<Object?>? navigateRoute
});




}
/// @nodoc
class __$AppErrorModelCopyWithImpl<$Res>
    implements _$AppErrorModelCopyWith<$Res> {
  __$AppErrorModelCopyWithImpl(this._self, this._then);

  final _AppErrorModel _self;
  final $Res Function(_AppErrorModel) _then;

/// Create a copy of AppErrorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,Object? data = freezed,Object? path = freezed,Object? navigateRoute = freezed,}) {
  return _then(_AppErrorModel(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,navigateRoute: freezed == navigateRoute ? _self.navigateRoute : navigateRoute // ignore: cast_nullable_to_non_nullable
as PageRouteInfo<Object?>?,
  ));
}


}

// dart format on
