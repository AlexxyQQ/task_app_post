import 'package:flutter_bloc/flutter_bloc.dart';

import '../crud.bloc.dart';

/// A mixin that adds multi-item selection functionality to a [CrudBloc].
///
/// This mixin provides the logic to select and deselect multiple entities (`T`)
/// from the list managed by the BLoC. It introduces `ToggleSelectEntityEvent`
/// to add or remove an item from the selection and `ClearAllSelectionsEvent`
/// to deselect all items.
///
/// ## Features
/// - **Toggle Selection**: Dispatching `ToggleSelectEntityEvent` for an entity
///   will add it to the selection if it's not already selected, or remove it
///   if it is.
/// - **Clear Selection**: Dispatching `ClearAllSelectionsEvent` removes all
///   entities from the selection.
/// - **State Management**: The selection is managed via the `selectedEntities`
///   list in the `CrudState`.
///
/// ## How to Use
/// 1.  Add `with MultiSelectableCrudMixin<T, ID>` to your BLoC that extends `CrudBloc`.
/// 2.  Call `registerMultiSelectableHandlers()` in your BLoC's constructor.
///
/// ## Example
///
/// Imagine a to-do list app where you can select multiple tasks to delete them at once.
///
/// ```dart
/// // 1. Your concrete BLoC using the mixin
/// class TaskBloc extends CrudBloc<Task, String>
///     with MultiSelectableCrudMixin<Task, String> {
///
///   final ITaskRepository _repository;
///
///   TaskBloc({required ITaskRepository repository})
///       : _repository = repository {
///     // IMPORTANT: Register the mixin's event handlers
///     registerMultiSelectableHandlers();
///   }
///
///   // --- Implement abstract methods from CrudBloc ---
///   @override
///   String getEntityId(Task entity) => entity.id;
///   // ... other CrudBloc methods
/// }
///
/// // 2. In your UI, dispatch events to manage the selection
/// void onTaskToggled(Task task) {
///   context.read<TaskBloc>().add(ToggleSelectEntityEvent(entity: task));
/// }
///
/// void onClearSelection() {
///    context.read<TaskBloc>().add(ClearAllSelectionsEvent<Task>());
/// }
///
/// // 3. Use the state in your UI to show the selection
/// BlocBuilder<TaskBloc, CrudState<Task>>(
///   builder: (context, state) {
///     return ListView.builder(
///       itemCount: state.entities.length,
///       itemBuilder: (context, index) {
///         final task = state.entities[index];
///         // Check if the current task is in the selected list
///         final isSelected = state.selectedEntities.any((e) => e.id == task.id);
///
///         return CheckboxListTile(
///           title: Text(task.title),
///           value: isSelected,
///           onChanged: (_) => onTaskToggled(task),
///         );
///       },
///     );
///   },
/// )
/// ```
mixin MultiSelectableCrudMixin<T, ID> on CrudBloc<T, ID> {
  /// Registers the event handlers for multi-entity selection.
  ///
  /// This must be called in the constructor of the BLoC using this mixin to
  /// enable listening for [ToggleSelectEntityEvent] and [ClearAllSelectionsEvent].
  void registerMultiSelectableHandlers() {
    on<ToggleSelectEntityEvent<T>>(_onToggleSelectEntity);
    on<ClearAllSelectionsEvent<T>>(_onClearAllSelections);
  }

  /// Handles the [ToggleSelectEntityEvent].
  ///
  /// It creates a mutable copy of the `selectedEntities` list. If the event's
  /// entity is already in the list, it's removed; otherwise, it's added.
  /// A new state is then emitted with the updated selection.
  Future<void> _onToggleSelectEntity(
    ToggleSelectEntityEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    final currentSelection = List<T>.from(state.selectedEntities);
    final entityId = getEntityId(event.entity);
    final isAlreadySelected = currentSelection.any(
      (e) => getEntityId(e) == entityId,
    );

    if (isAlreadySelected) {
      currentSelection.removeWhere((e) => getEntityId(e) == entityId);
    } else {
      currentSelection.add(event.entity);
    }

    emit(state.copyWith(selectedEntities: currentSelection));
  }

  /// Handles the [ClearAllSelectionsEvent].
  ///
  /// This emits a new state with an empty `selectedEntities` list, effectively
  /// deselecting all items.
  Future<void> _onClearAllSelections(
    ClearAllSelectionsEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    emit(state.copyWith(selectedEntities: []));
  }
}
