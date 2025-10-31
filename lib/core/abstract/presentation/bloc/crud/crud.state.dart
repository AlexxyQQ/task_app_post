// crud.state.dart
part of 'crud.bloc.dart';

@freezed
abstract class CrudState<T> with _$CrudState<T> {
  const CrudState._();

  const factory CrudState({
    @Default(false) bool isLoading,
    @Default([]) List<T> entities,
    @Default([]) List<T> filteredEntities,
    AppErrorModel? error,
    T? selectedEntity,
    @Default([]) List<T> selectedEntities, // For multi-select
    @Default('') String searchQuery, // For search
    String? successMessage,
  }) = _CrudState;

  factory CrudState.initial() => CrudState<T>();

  // Helper to know if search is active
  bool get isSearching => searchQuery.isNotEmpty;
}
