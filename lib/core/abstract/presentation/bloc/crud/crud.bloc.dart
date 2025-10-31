import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../config/constants/gen/locale_keys.g.dart';
import '../../../../common/data/models/error/app_error.model.dart';
import 'mixin/searchable_crud.mixin.dart'; // Assume this file exists

part 'crud.event.dart';
part 'crud.state.dart';
part 'crud.bloc.freezed.dart';

/// An abstract generic BLoC designed to handle common CRUD (Create, Read,
/// Update, Delete) operations for a specific entity type `T`.
///
/// This BLoC provides a reusable and structured foundation for managing data,
/// handling loading states, errors, and success messages. It is meant to be
/// extended by a concrete BLoC that implements the abstract methods to interact
/// with a specific repository.
///
/// Functionality can be further extended by using mixins, such as
/// `SearchableCrudMixin` for filtering data or `SelectableCrudMixin` for
/// managing selections.
///
/// ## Type Parameters
/// * `T`: The type of the entity this BLoC will manage (e.g., `UserModel`, `Product`).
/// * `ID`: The type of the entity's unique identifier (e.g., `String`, `int`).
///
/// ## Core Responsibilities
/// - **Fetching Data**: Loads all entities (`GetAllEntitiesEvent`) or a single entity
///   by its ID (`GetEntityByIdEvent`).
/// - **Data Manipulation**: Creates (`CreateEntityEvent`), updates (`UpdateEntityEvent`),
///   and deletes (`DeleteEntityEvent`) entities.
/// - **State Management**: Manages `isLoading`, `error`, `successMessage`, and the
///   list of `entities`.
/// - **Integration with Mixins**: Includes helper methods like `_updateEntitiesInState`
///   that intelligently work with mixins. For example, it automatically applies
///   the current search filter after a data modification if `SearchableCrudMixin`
///   is used.
///
/// ## Example Usage
///
/// First, define your model and repository interface.
///
/// ```dart
/// // 1. Model
/// class Product {
///   final String id;
///   final String name;
///   Product({required this.id, required this.name});
/// }
///
/// // 2. Repository Interface
/// abstract class IProductRepository {
///   Future<Either<AppErrorModel, List<Product>>> getAllProducts();
///   Future<Either<AppErrorModel, Product>> createProduct(Product product);
///   // ... other methods
/// }
/// ```
///
/// Next, create a concrete BLoC that extends `CrudBloc` and uses the
/// `SearchableCrudMixin`.
///
/// ```dart
/// // 3. Concrete BLoC Implementation
/// class ProductBloc extends CrudBloc<Product, String>
///     with SearchableCrudMixin<Product, String> {
///   final IProductRepository _repository;
///
///   ProductBloc({required IProductRepository repository})
///       : _repository = repository {
///     // IMPORTANT: Register handlers from the mixin
///     registerSearchableHandlers();
///   }
///
///   // --- Implementation of CrudBloc abstract methods ---
///
///   @override
///   String getEntityId(Product entity) => entity.id;
///
///   @override
///   Future<Either<AppErrorModel, List<Product>>> readAllEntities() {
///     return _repository.getAllProducts();
///   }
///
///   @override
///   Future<Either<AppErrorModel, Product>> createEntity(Product entity) {
///     return _repository.createProduct(product: entity);
///   }
///
///   // ... implement other abstract methods (readEntity, updateEntity, etc.)
///
///   // --- Implementation of SearchableCrudMixin abstract methods ---
///
///   @override
///   bool isSearchMatch(Product entity, String query) {
///     return entity.name.toLowerCase().contains(query.toLowerCase());
///   }
/// }
/// ```
///
/// Finally, use the `ProductBloc` in your UI.
///
/// ```dart
/// // 4. Using the BLoC in a Widget
/// // To fetch all products:
/// context.read<ProductBloc>().add(GetAllEntitiesEvent<Product>());
///
/// // To search for products:
/// context.read<ProductBloc>().add(SearchChangedEvent<Product>(query: 'Laptop'));
/// ```
abstract class CrudBloc<T, ID> extends Bloc<CrudEvent<T>, CrudState<T>> {
  CrudBloc() : super(CrudState.initial()) {
    on<GetAllEntitiesEvent<T>>(_onGetAllEntities);
    on<GetEntityByIdEvent<T>>(_onGetEntityById);
    on<CreateEntityEvent<T>>(_onCreateEntity);
    on<UpdateEntityEvent<T>>(_onUpdateEntity);
    on<DeleteEntityEvent<T>>(_onDeleteEntity);
    on<CreateEntitiesEvent<T>>(_onCreateEntities);
  }

  // region Abstract Methods (to be implemented by subclasses)

  /// A function that returns the unique identifier for a given entity.
  /// This is crucial for update and delete operations.
  ID getEntityId(T entity);

  /// An abstract method to fetch all entities from the repository.
  Future<Either<AppErrorModel, List<T>>> readAllEntities();

  /// An abstract method to fetch a single entity by its ID from the repository.
  Future<Either<AppErrorModel, T>> readEntity(ID id);

  /// An abstract method to create a new entity in the repository.
  Future<Either<AppErrorModel, T>> createEntity(T entity);

  /// An abstract method to create multiple entities in the repository.
  Future<Either<AppErrorModel, List<T>>> createEntities(List<T> entities);

  /// An abstract method to update an existing entity in the repository.
  Future<Either<AppErrorModel, T>> updateEntity(T entity);

  /// An abstract method to delete an entity by its ID from the repository.
  Future<Either<AppErrorModel, void>> deleteEntity(ID id);

  // endregion

  // region Helper Methods

  /// Updates the entities in the state while intelligently applying search filters
  /// if the [SearchableCrudMixin] is used.
  ///
  /// This ensures that after adding, updating, or removing an item, the
  /// visible list of items remains correctly filtered based on the current search query.
  void _updateEntitiesInState(Emitter<CrudState<T>> emit, List<T> entities) {
    if (this is SearchableCrudMixin) {
      // If the search mixin is used, re-apply the current filter to the new list.
      final filtered =
          (this as SearchableCrudMixin).applySearch(entities) as List<T>;
      emit(state.copyWith(entities: entities, filteredEntities: filtered));
    } else {
      // Otherwise, just update the main list and clear any old filters.
      emit(state.copyWith(entities: entities, filteredEntities: []));
    }
  }

  // endregion

  // region Event Handlers

  Future<void> _onGetAllEntities(
    GetAllEntitiesEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await readAllEntities();
    result.fold(
      (error) => emit(state.copyWith(error: error, isLoading: false)),
      (entities) {
        emit(state.copyWith(isLoading: false, error: null));
        _updateEntitiesInState(emit, entities);
      },
    );
  }

  Future<void> _onGetEntityById(
    GetEntityByIdEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await readEntity(event.id as ID);
    result.fold(
      (error) => emit(state.copyWith(error: error, isLoading: false)),
      (entity) =>
          emit(state.copyWith(selectedEntity: entity, isLoading: false)),
    );
  }

  Future<void> _onCreateEntity(
    CreateEntityEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await createEntity(event.entity);
    result.fold(
      (error) => emit(state.copyWith(error: error, isLoading: false)),
      (entity) {
        final updatedList = [...state.entities, entity];
        emit(
          state.copyWith(
            isLoading: false,
            selectedEntity: entity,
            successMessage: LocaleKeys
                .core_abstract_presentation_bloc_crud_createdSuccessMessage,
          ),
        );
        _updateEntitiesInState(emit, updatedList);
      },
    );
  }

  Future<void> _onCreateEntities(
    CreateEntitiesEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await createEntities(event.entities);
    result.fold(
      (error) => emit(state.copyWith(error: error, isLoading: false)),
      (entities) {
        final updatedList = [...state.entities, ...entities];
        emit(
          state.copyWith(
            isLoading: false,
            selectedEntity: entities.isNotEmpty ? entities.first : null,
            successMessage: LocaleKeys
                .core_abstract_presentation_bloc_crud_createdSuccessMessage,
          ),
        );
        _updateEntitiesInState(emit, updatedList);
      },
    );
  }

  Future<void> _onUpdateEntity(
    UpdateEntityEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await updateEntity(event.entity);
    result.fold(
      (error) => emit(state.copyWith(error: error, isLoading: false)),
      (entity) {
        final updatedList = state.entities
            .map((e) => getEntityId(e) == getEntityId(entity) ? entity : e)
            .toList();
        emit(
          state.copyWith(
            isLoading: false,
            successMessage: LocaleKeys
                .core_abstract_presentation_bloc_crud_updateSuccessMessage,
            selectedEntity: entity,
          ),
        );

        _updateEntitiesInState(emit, updatedList);
      },
    );
  }

  Future<void> _onDeleteEntity(
    DeleteEntityEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null, successMessage: null));
    final result = await deleteEntity(getEntityId(event.entity));
    result.fold(
      (error) => emit(state.copyWith(error: error, isLoading: false)),
      (_) {
        final updatedList = state.entities
            .where((e) => getEntityId(e) != getEntityId(event.entity))
            .toList();
        emit(
          state.copyWith(
            isLoading: false,
            successMessage: LocaleKeys
                .core_abstract_presentation_bloc_crud_deleteSuccessMessage,
          ),
        );
        _updateEntitiesInState(emit, updatedList);
      },
    );
  }

  // endregion
}
