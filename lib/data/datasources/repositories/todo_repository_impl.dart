import 'package:practisetotheory/data/datasources/todo_local_data_source.dart';
import 'package:practisetotheory/domain/entities/todo_entity.dart';
import 'package:practisetotheory/domain/repositories/todo_repository.dart';

import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  Future<List<TodoEntity>> getTodos() async {
    final todos = await dataSource.getTodos();

    return todos.map((todo) => todo as TodoEntity).toList();
  }

  Future<void> addTodo(TodoEntity todo) async {
    final todoModel = TodoModel.fromEntity(todo);
    await dataSource.addTodo(todoModel);
  }

  Future<void> removeTodo(int id) async {
    await dataSource.removeTodo(id);
  }
}
