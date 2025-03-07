import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practisetotheory/domain/usecases/add._todo.dart';
import 'data/datasources/repositories/todo_repository_impl.dart';
import 'presentation/blocs/pages/home_page.dart';
import 'presentation/blocs/todo_bloc.dart';
import 'domain/usecases/get_todos.dart';

import 'data/datasources/todo_local_data_source.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataSource = TodoLocalDataSource();
    final repository = TodoRepositoryImpl(dataSource);
    return MaterialApp(
      home: BlocProvider(
        create: (_) => TodoBloc(
          getTodos: GetTodos(repository),
          addTodo: AddTodo(repository),
        )..add(LoadTodosEvent()),
        child: HomePage(),
      ),
    );
  }
}
