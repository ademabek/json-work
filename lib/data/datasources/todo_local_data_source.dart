import 'package:practisetotheory/data/datasources/models/todo_model.dart';

class TodoLocalDataSource {
  final List<TodoModel> _todos = [];

  Future<List<TodoModel>> getTodos() async {
    return _todos;
  }

  Future<void> addTodo(TodoModel todo) async {
    _todos.add(todo);
  }

  Future<void> removeTodo(int id) async {
    _todos.removeWhere((todo) => todo.id == id);
  }
}
