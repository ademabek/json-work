import 'package:flutter/material.dart';
import 'package:practisetotheory/services/json_service.dart';

import '../../../data/datasources/models/todo_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JsonService _jsonService = JsonService();
  List<TodoModel> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todos = await _jsonService.loadTodos();
    setState(() {
      _todos = todos;
    });
  }

  void _addTodo() async {
    final newTodo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: 'New Task',
      isCompleted: false,
    );
    setState(() {
      _todos.add(newTodo);
    });
    await _jsonService.saveTodos(_todos);
  }

  void _toggleComplete(TodoModel todo) async {
    setState(() {
      final index = _todos.indexWhere((t) => t.id == todo.id);
      if (index != -1) {
        _todos[index] = TodoModel(
          id: todo.id,
          title: todo.title,
          isCompleted: !todo.isCompleted,
        );
      }
    });
    await _jsonService.saveTodos(_todos);
  }

  void _removeTodo(TodoModel todo) async {
    setState(() {
      _todos.removeWhere((t) => t.id == todo.id);
    });
    await _jsonService.saveTodos(_todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List (JSON)')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (_) => _toggleComplete(todo),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removeTodo(todo),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
