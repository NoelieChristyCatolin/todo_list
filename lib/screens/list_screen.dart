import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc/todo_cubit.dart';
import 'package:todo_list/bloc/todo_state.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({required this.title, this.isCompletted}) : super();

  final String title;
  final bool? isCompletted;

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  void initState() {
    super.initState();
    print('widget.isCompletted: ${widget.isCompletted}');
    context.read<TodoCubit>().getTodos(isCompletted: widget.isCompletted);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) =>  Column(
        children: [
          Text(widget.title),
          Expanded(
            child: ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Checkbox(
                    // value:  isCompleted(state.todos[index]),
                    value: state.todos[index].isCompleted,
                    onChanged: (value){
                      setState(() {
                        context.read<TodoCubit>().updatedTodoStatus(index);
                      });
                    },
                  ),
                  title: Text(state.todos[index].item),)),
          ),
        ],
      ),
    );
  }
}
