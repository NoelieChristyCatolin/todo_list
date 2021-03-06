import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_list/domain/bloc/todo_cubit.dart';
import 'package:todo_list/domain/bloc/todo_state.dart';

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
    //calls the list of todos according to status
    context.read<TodoCubit>().getTodos(isCompleted: widget.isCompletted);
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) =>  Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Checkbox(
                      value: state.todos[index].isCompleted,
                      onChanged: (value){
                        setState(() {
                          //updates the value of the checkbox from being selected or not
                          context.read<TodoCubit>().updatedTodoStatus(state.todos[index]);
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
                              //adds the inputted text when submit is clicked
                              context.read<TodoCubit>().addTodo(inputController.text);
                              inputController.clear();
                              Navigator.pop(context);
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
