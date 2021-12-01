import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/bloc/todo_cubit.dart';
import 'package:todo_list/domain/bloc/todo_state.dart';
import 'package:todo_list/presentaion/list_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int _selectedIndex = 0;
  List<Widget> navigationScreens = [];

  @override
  Widget build(BuildContext context) {
    setState(() {
      navigationScreens = <Widget>[
        const ListScreen(title: 'All'),
        const ListScreen(title: 'Completed', isCompletted: true),
        const ListScreen(title: 'Incomplete', isCompletted: false),
      ];
    });

    return BlocBuilder<TodoCubit, TodoState>(builder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text("To Do's"),),
      body: navigationScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Complete'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Incomplete'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
      ),
    ));
  }

  onItemTapped(int value){
    setState(() {
      _selectedIndex = value;
    });
  }
}
