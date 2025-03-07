import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practisetotheory/domain/usecases/add._todo.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/get_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  final AddTodo addTodo;

  TodoBloc({
    required this.getTodos,
    required this.addTodo,
  }) : super(TodoLoading()) {
    on<LoadTodosEvent>((event, emit) async {
      emit(TodoLoading());
      final todos = await getTodos();
      emit(TodoLoaded(todos));
    });

    on<AddTodoEvent>((event, emit) async {
      await addTodo(event.todo);
      add(LoadTodosEvent());
    });
  }
}
