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
    ListScreen(title: 'All',),
    ListScreen(title: 'Complete',),
    ListScreen(title: 'Incomplete',),
    // Container(
    //   child: const Text('Screen 1'),
    //   color: Colors.lightBlue,
    // ),
    // Container(
    //   child: const Text('Screen 2'),
    //   color: Colors.lightBlue,
    // ),
    // Container(
    //   child: const Text('Screen 3'),
    //   color: Colors.lightBlue,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do's"),),
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
