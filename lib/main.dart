import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/todo_repository.dart';
import 'package:todo_list/domain/bloc/todo_cubit.dart';
import 'package:todo_list/presentaion/todo_screen.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static String storageName = 'TodoStorage';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(todoRepository: TodoRepository(storage: LocalStorage(storageName))),
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
