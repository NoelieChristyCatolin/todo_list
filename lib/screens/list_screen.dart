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

  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<TodoCubit>().getTodos(isCompletted: widget.isCompletted);
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) =>  Scaffold(
        body: Column(
          children: [
            Text(widget.title),
            Expanded(
              child: ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Checkbox(
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showModalBottomSheet(context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Wrap(
                  children: [
                    const Center(child: Text('What do you plan to do?')),
                    TextField(
                      controller: inputController,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              context.read<TodoCubit>().addTodo(inputController.text);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add),
                              Text('Add'),
                            ],)

                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
