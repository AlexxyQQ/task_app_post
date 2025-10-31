// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crud.bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CrudState<T> {

 bool get isLoading; List<T> get entities; List<T> get filteredEntities; AppErrorModel? get error; T? get selectedEntity; List<T> get selectedEntities;// For multi-select
 String get searchQuery;// For search
 String? get successMessage;
/// Create a copy of CrudState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrudStateCopyWith<T, CrudState<T>> get copyWith => _$CrudStateCopyWithImpl<T, CrudState<T>>(this as CrudState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrudState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.entities, entities)&&const DeepCollectionEquality().equals(other.filteredEntities, filteredEntities)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.selectedEntity, selectedEntity)&&const DeepCollectionEquality().equals(other.selectedEntities, selectedEntities)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(entities),const DeepCollectionEquality().hash(filteredEntities),error,const DeepCollectionEquality().hash(selectedEntity),const DeepCollectionEquality().hash(selectedEntities),searchQuery,successMessage);

@override
String toString() {
  return 'CrudState<$T>(isLoading: $isLoading, entities: $entities, filteredEntities: $filteredEntities, error: $error, selectedEntity: $selectedEntity, selectedEntities: $selectedEntities, searchQuery: $searchQuery, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $CrudStateCopyWith<T,$Res>  {
  factory $CrudStateCopyWith(CrudState<T> value, $Res Function(CrudState<T>) _then) = _$CrudStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<T> entities, List<T> filteredEntities, AppErrorModel? error, T? selectedEntity, List<T> selectedEntities, String searchQuery, String? successMessage
});


$AppErrorModelCopyWith<$Res>? get error;

}
/// @nodoc
class _$CrudStateCopyWithImpl<T,$Res>
    implements $CrudStateCopyWith<T, $Res> {
  _$CrudStateCopyWithImpl(this._self, this._then);

  final CrudState<T> _self;
  final $Res Function(CrudState<T>) _then;

/// Create a copy of CrudState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? entities = null,Object? filteredEntities = null,Object? error = freezed,Object? selectedEntity = freezed,Object? selectedEntities = null,Object? searchQuery = null,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,entities: null == entities ? _self.entities : entities // ignore: cast_nullable_to_non_nullable
as List<T>,filteredEntities: null == filteredEntities ? _self.filteredEntities : filteredEntities // ignore: cast_nullable_to_non_nullable
as List<T>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrorModel?,selectedEntity: freezed == selectedEntity ? _self.selectedEntity : selectedEntity // ignore: cast_nullable_to_non_nullable
as T?,selectedEntities: null == selectedEntities ? _self.selectedEntities : selectedEntities // ignore: cast_nullable_to_non_nullable
as List<T>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CrudState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorModelCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppErrorModelCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [CrudState].
extension CrudStatePatterns<T> on CrudState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CrudState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CrudState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CrudState<T> value)  $default,){
final _that = this;
switch (_that) {
case _CrudState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CrudState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _CrudState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<T> entities,  List<T> filteredEntities,  AppErrorModel? error,  T? selectedEntity,  List<T> selectedEntities,  String searchQuery,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CrudState() when $default != null:
return $default(_that.isLoading,_that.entities,_that.filteredEntities,_that.error,_that.selectedEntity,_that.selectedEntities,_that.searchQuery,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<T> entities,  List<T> filteredEntities,  AppErrorModel? error,  T? selectedEntity,  List<T> selectedEntities,  String searchQuery,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _CrudState():
return $default(_that.isLoading,_that.entities,_that.filteredEntities,_that.error,_that.selectedEntity,_that.selectedEntities,_that.searchQuery,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<T> entities,  List<T> filteredEntities,  AppErrorModel? error,  T? selectedEntity,  List<T> selectedEntities,  String searchQuery,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _CrudState() when $default != null:
return $default(_that.isLoading,_that.entities,_that.filteredEntities,_that.error,_that.selectedEntity,_that.selectedEntities,_that.searchQuery,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CrudState<T> extends CrudState<T> {
  const _CrudState({this.isLoading = false, final  List<T> entities = const [], final  List<T> filteredEntities = const [], this.error, this.selectedEntity, final  List<T> selectedEntities = const [], this.searchQuery = '', this.successMessage}): _entities = entities,_filteredEntities = filteredEntities,_selectedEntities = selectedEntities,super._();
  

@override@JsonKey() final  bool isLoading;
 final  List<T> _entities;
@override@JsonKey() List<T> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}

 final  List<T> _filteredEntities;
@override@JsonKey() List<T> get filteredEntities {
  if (_filteredEntities is EqualUnmodifiableListView) return _filteredEntities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredEntities);
}

@override final  AppErrorModel? error;
@override final  T? selectedEntity;
 final  List<T> _selectedEntities;
@override@JsonKey() List<T> get selectedEntities {
  if (_selectedEntities is EqualUnmodifiableListView) return _selectedEntities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEntities);
}

// For multi-select
@override@JsonKey() final  String searchQuery;
// For search
@override final  String? successMessage;

/// Create a copy of CrudState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CrudStateCopyWith<T, _CrudState<T>> get copyWith => __$CrudStateCopyWithImpl<T, _CrudState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CrudState<T>&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._entities, _entities)&&const DeepCollectionEquality().equals(other._filteredEntities, _filteredEntities)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.selectedEntity, selectedEntity)&&const DeepCollectionEquality().equals(other._selectedEntities, _selectedEntities)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_entities),const DeepCollectionEquality().hash(_filteredEntities),error,const DeepCollectionEquality().hash(selectedEntity),const DeepCollectionEquality().hash(_selectedEntities),searchQuery,successMessage);

@override
String toString() {
  return 'CrudState<$T>(isLoading: $isLoading, entities: $entities, filteredEntities: $filteredEntities, error: $error, selectedEntity: $selectedEntity, selectedEntities: $selectedEntities, searchQuery: $searchQuery, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$CrudStateCopyWith<T,$Res> implements $CrudStateCopyWith<T, $Res> {
  factory _$CrudStateCopyWith(_CrudState<T> value, $Res Function(_CrudState<T>) _then) = __$CrudStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<T> entities, List<T> filteredEntities, AppErrorModel? error, T? selectedEntity, List<T> selectedEntities, String searchQuery, String? successMessage
});


@override $AppErrorModelCopyWith<$Res>? get error;

}
/// @nodoc
class __$CrudStateCopyWithImpl<T,$Res>
    implements _$CrudStateCopyWith<T, $Res> {
  __$CrudStateCopyWithImpl(this._self, this._then);

  final _CrudState<T> _self;
  final $Res Function(_CrudState<T>) _then;

/// Create a copy of CrudState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? entities = null,Object? filteredEntities = null,Object? error = freezed,Object? selectedEntity = freezed,Object? selectedEntities = null,Object? searchQuery = null,Object? successMessage = freezed,}) {
  return _then(_CrudState<T>(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<T>,filteredEntities: null == filteredEntities ? _self._filteredEntities : filteredEntities // ignore: cast_nullable_to_non_nullable
as List<T>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppErrorModel?,selectedEntity: freezed == selectedEntity ? _self.selectedEntity : selectedEntity // ignore: cast_nullable_to_non_nullable
as T?,selectedEntities: null == selectedEntities ? _self._selectedEntities : selectedEntities // ignore: cast_nullable_to_non_nullable
as List<T>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CrudState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorModelCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppErrorModelCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
