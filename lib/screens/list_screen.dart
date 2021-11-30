import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/todo_cubit.dart';
import 'package:todo_list/bloc/todo_state.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({required this.title}) : super();

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) =>  Column(
        children: [
          Text(title),
          Expanded(
            child: ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.todos[index].item),)),
          ),
        ],
      ),
    );
  }
}
