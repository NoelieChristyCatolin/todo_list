import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({required this.title}) : super();

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => ListTile(
              title: Text('Item $index'),)),
        ),
      ],
    );
  }
}
