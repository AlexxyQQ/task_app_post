import 'package:flutter_bloc/flutter_bloc.dart';
import '../crud.bloc.dart';

/// A mixin that adds single-item selection functionality to a [CrudBloc].
///
/// This mixin provides the logic to select and deselect a single entity (`T`)
/// from the list managed by the BLoC. It introduces a `SelectEntityEvent`
/// to handle selection changes.
///
/// ## Features
/// - **Toggle Selection**: Dispatching `SelectEntityEvent` with an entity will
///   select it. Dispatching the same event again for the currently selected
///   entity will deselect it (setting `selectedEntity` in the state to `null`).
/// - **State Management**: The selection is managed via the `selectedEntity`
///   property in the `CrudState`.
///
/// ## How to Use
///
/// 1.  Add `with SelectableCrudMixin<T, ID>` to your BLoC that extends `CrudBloc`.
/// 2.  Call `registerSelectableHandlers()` in your BLoC's constructor to activate
///     the event listener.
///
/// ## Example
///
/// Consider a `CategoryBloc` that needs to manage a selected category.
///
/// ```dart
/// // 1. Your concrete BLoC using the mixin
/// class CategoryBloc extends CrudBloc<Category, String>
///     with SelectableCrudMixin<Category, String> {
///
///   final ICategoryRepository _repository;
///
///   CategoryBloc({required ICategoryRepository repository})
///       : _repository = repository {
///     // IMPORTANT: Register the mixin's event handlers
///     registerSelectableHandlers();
///   }
///
///   // --- Implement abstract methods from CrudBloc ---
///   @override
///   String getEntityId(Category entity) => entity.id;
///
///   @override
///   Future<Either<AppErrorModel, List<Category>>> readAllEntities() {
///     return _repository.getAllCategories();
///   }
///   // ... other CrudBloc methods
/// }
///
/// // 2. In your UI, dispatch the event to select a category
/// void onCategoryTapped(Category category) {
///   context.read<CategoryBloc>().add(SelectEntityEvent(entity: category));
/// }
///
/// // 3. Listen to the state in your UI to show the selection
/// BlocBuilder<CategoryBloc, CrudState<Category>>(
///   builder: (context, state) {
///     return ListView.builder(
///       itemCount: state.entities.length,
///       itemBuilder: (context, index) {
///         final category = state.entities[index];
///         final isSelected = state.selectedEntity?.id == category.id;
///
///         return ListTile(
///           title: Text(category.name),
///           tileColor: isSelected ? Colors.blue.withOpacity(0.2) : null,
///           onTap: () => onCategoryTapped(category),
///         );
///       },
///     );
///   },
/// )
/// ```
mixin SelectableCrudMixin<T, ID> on CrudBloc<T, ID> {
  /// Registers the event handler for single entity selection.
  ///
  /// This method must be called in the constructor of the BLoC that uses this
  /// mixin to ensure that it listens for [SelectEntityEvent].
  void registerSelectableHandlers() {
    on<SelectEntityEvent<T>>(_onSelectEntity);
  }

  /// Handles the [SelectEntityEvent] to update the selection state.
  ///
  /// If the entity in the event is the same as the currently selected one,
  /// it deselects it by setting `selectedEntity` to `null`. Otherwise, it
  /// updates `selectedEntity` with the new entity.
  Future<void> _onSelectEntity(
    SelectEntityEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    // If the incoming entity is null, always deselect.
    if (event.entity == null) {
      emit(state.copyWith(selectedEntity: null));
      return;
    }

    final bool isAlreadySelected =
        state.selectedEntity != null &&
        getEntityId(state.selectedEntity as T) ==
            getEntityId(event.entity as T);

    if (isAlreadySelected) {
      // If the incoming entity is the same as the currently selected one, deselect it.
      emit(state.copyWith(selectedEntity: null));
    } else {
      // Otherwise, select the new entity.
      emit(state.copyWith(selectedEntity: event.entity));
    }
  }
}
