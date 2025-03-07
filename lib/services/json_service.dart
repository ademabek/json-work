import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:practisetotheory/data/datasources/models/todo_model.dart';

class JsonService {
  static const String _filePath = 'assets/todos.json';

  Future<List<TodoModel>> loadTodos() async {
    final jsonString = await rootBundle.loadString(_filePath);
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => TodoModel.fromJson(item)).toList();
  }

  Future<void> saveTodos(List<TodoModel> todos) async {
    final jsonString = json.encode(todos.map((todo) => todo.toJson()).toList());
    print("Сохранено в JSON: $jsonString");
  }
}
