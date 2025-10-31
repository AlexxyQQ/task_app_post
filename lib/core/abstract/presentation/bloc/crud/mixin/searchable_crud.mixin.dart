import 'package:flutter_bloc/flutter_bloc.dart';
import '../crud.bloc.dart';

/// A mixin that adds client-side search and filtering capabilities to a [CrudBloc].
///
/// This mixin handles the logic for filtering the main `entities` list based on a
/// search query. It introduces a `SearchChangedEvent` and maintains the filtered
/// results in the `filteredEntities` list within the `CrudState`.
///
/// ## 🧠 How It Works
/// The mixin listens for a `SearchChangedEvent`. When the query changes, it
/// iterates through the master `entities` list and uses the abstract `isSearchMatch`
/// method (which you must implement) to decide if an entity should be included
/// in the `filteredEntities` list.
///
/// The base `CrudBloc` is designed to work with this mixin. When you create,
/// update, or delete an item, the base BLoC automatically calls `applySearch` to ensure
/// the filtered list remains up-to-date.
///
/// ## 🚀 How to Use
/// 1.  Add `with SearchableCrudMixin<T, ID>` to your BLoC that extends `CrudBloc`.
/// 2.  **Override the `isSearchMatch` method** to define your custom search logic.
/// 3.  Call `registerSearchableHandlers()` in your BLoC's constructor.
///
/// ## Example
///
/// Let's create a `ProductBloc` that can filter products by name.
///
/// ```dart
/// // 1. Your concrete BLoC using the mixin
/// class ProductBloc extends CrudBloc<Product, String>
///     with SearchableCrudMixin<Product, String> {
///
///   final IProductRepository _repository;
///
///   ProductBloc({required IProductRepository repository})
///       : _repository = repository {
///     // IMPORTANT: Register the mixin's event handlers
///     registerSearchableHandlers();
///   }
///
///   // --- Implementation from CrudBloc ---
///   @override
///   String getEntityId(Product entity) => entity.id;
///   // ... other CrudBloc methods
///
///   // --- REQUIRED: Implementation from SearchableCrudMixin ---
///   @override
///   bool isSearchMatch(Product entity, String query) {
///     // Define how to match a product against the query
///     return entity.name.toLowerCase().contains(query.toLowerCase());
///   }
/// }
///
/// // 2. In your UI, dispatch the event from a TextField's onChanged callback
/// TextField(
///   onChanged: (value) {
///     context.read<ProductBloc>().add(SearchChangedEvent<Product>(query: value));
///   },
///   decoration: InputDecoration(labelText: 'Search Products...'),
/// )
///
/// // 3. Use the state to display the correct list
/// BlocBuilder<ProductBloc, CrudState<Product>>(
///   builder: (context, state) {
///     // Display filteredEntities if a search is active, otherwise display all entities.
///     final productsToShow = state.isSearching ? state.filteredEntities : state.entities;
///
///     return ListView.builder(
///       itemCount: productsToShow.length,
///       itemBuilder: (context, index) {
///         return ListTile(title: Text(productsToShow[index].name));
///       },
///     );
///   },
/// )
/// ```
mixin SearchableCrudMixin<T, ID> on CrudBloc<T, ID> {
  /// An abstract method that defines the logic for matching an entity against a
  /// search query.
  ///
  /// You **MUST** override this in your concrete BLoC. The logic inside this
  /// method determines which items appear in the `filteredEntities` list.
  ///
  /// ### Example Implementation:
  /// ```dart
  /// @override
  /// bool isSearchMatch(User user, String query) {
  ///   final lowerCaseQuery = query.toLowerCase();
  ///   return user.name.toLowerCase().contains(lowerCaseQuery) ||
  ///          user.email.toLowerCase().contains(lowerCaseQuery);
  /// }
  /// ```
  bool isSearchMatch(T entity, String query);

  /// Registers the event handler for searching.
  ///
  /// This must be called in the constructor of the BLoC using this mixin to
  /// enable listening for [SearchChangedEvent].
  void registerSearchableHandlers() {
    on<SearchChangedEvent<T>>(_onSearchChanged);
  }

  /// Applies the current search query from the state to a given list of entities.
  ///
  /// This method is used internally by the mixin and the base [CrudBloc] to
  /// generate the `filteredEntities` list. It returns all entities if the
  /// search query is empty.
  List<T> applySearch(List<T> entities) {
    if (state.searchQuery.isEmpty) {
      return entities; // Return all if no query is active
    }
    return entities
        .where((entity) => isSearchMatch(entity, state.searchQuery))
        .toList();
  }

  /// Handles the [SearchChangedEvent].
  ///
  /// It updates the `searchQuery` in the state and then applies the filter to
  /// the master `entities` list, emitting a new state with the updated
  /// `filteredEntities`.
  Future<void> _onSearchChanged(
    SearchChangedEvent<T> event,
    Emitter<CrudState<T>> emit,
  ) async {
    final query = event.query.trim();
    // First, emit the new search query to update the UI (e.g., the text field)
    emit(state.copyWith(searchQuery: query));

    // Then, apply the filter to the master list of entities
    final filteredList = applySearch(state.entities);
    // Finally, emit the new filtered list
    emit(state.copyWith(filteredEntities: filteredList));
  }
}
