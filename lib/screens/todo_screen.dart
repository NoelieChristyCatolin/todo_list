import 'package:flutter/material.dart';
import 'package:todo_list/screens/list_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int _selectedindex = 0;
  List<Widget> navigationScreens = <Widget>[
    const ListScreen(title: 'All',),
    const ListScreen(title: 'Complete',),
    const ListScreen(title: 'Incomplete',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do's"),),
      body: navigationScreens.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Complete'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Incomplete'),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }

  onItemTapped(int value){
    setState(() {
      _selectedindex = value;
    });
  }
}
