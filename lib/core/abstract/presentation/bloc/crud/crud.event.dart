// crud.event.dart
part of 'crud.bloc.dart';

abstract class CrudEvent<T> extends Equatable {
  const CrudEvent();

  @override
  List<Object?> get props => [];
}

// === CORE CRUD EVENTS ===
class GetAllEntitiesEvent<T> extends CrudEvent<T> {}

class GetEntityByIdEvent<T> extends CrudEvent<T> {
  const GetEntityByIdEvent({required this.id});
  final String id;
  @override
  List<Object?> get props => [id];
}

class CreateEntityEvent<T> extends CrudEvent<T> {
  const CreateEntityEvent({required this.entity});
  final T entity;
  @override
  List<Object?> get props => [entity];
}

class CreateEntitiesEvent<T> extends CrudEvent<T> {
  const CreateEntitiesEvent({required this.entities});
  final List<T> entities;
  @override
  List<Object?> get props => [entities];
}

class UpdateEntityEvent<T> extends CrudEvent<T> {
  const UpdateEntityEvent({required this.entity});
  final T entity;
  @override
  List<Object?> get props => [entity];
}

class DeleteEntityEvent<T> extends CrudEvent<T> {
  const DeleteEntityEvent({required this.entity});
  final T entity;
  @override
  List<Object?> get props => [entity];
}

// === SELECTABLE EVENTS ===
class SelectEntityEvent<T> extends CrudEvent<T> {
  // Nullable to allow clearing selection
  const SelectEntityEvent({this.entity});
  final T? entity;
  @override
  List<Object?> get props => [entity];
}

// === MULTI-SELECTABLE EVENTS ===
class ToggleSelectEntityEvent<T> extends CrudEvent<T> {
  const ToggleSelectEntityEvent({required this.entity});
  final T entity;
  @override
  List<Object?> get props => [entity];
}

class ClearAllSelectionsEvent<T> extends CrudEvent<T> {}

// === SEARCHABLE EVENTS ===
class SearchChangedEvent<T> extends CrudEvent<T> {
  const SearchChangedEvent({required this.query});
  final String query;
  @override
  List<Object?> get props => [query];
}
