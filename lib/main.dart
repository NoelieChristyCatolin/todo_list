import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/todo_repository.dart';
import 'package:todo_list/bloc/todo_cubit.dart';
import 'package:todo_list/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(todoRepository: TodoRepository()),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TodoScreen()
      ),
    );
  }
}
