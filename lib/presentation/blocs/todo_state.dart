part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoEntity> todos;

  TodoLoaded(this.todos);
}
