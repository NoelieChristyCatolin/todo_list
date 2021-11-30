import 'package:todo_list/models/todo.dart';

class TodoRepository {
  TodoRepository();

  final List<Todo> _todos = [
    Todo(item: 'To do 1'),
    Todo(item: 'To do 2', isCompleted: true),
    Todo(item: 'To do 3'),
    Todo(item: 'To do 4', isCompleted: true),
    Todo(item: 'To do 5', isCompleted: false),
    Todo(item: 'To do 6'),
  ];

  List<Todo> getTodos(){
    return _todos;
  }


  List<Todo> updateTodos(int index){
    _todos[index].isCompleted = !_todos[index].isCompleted;
    return _todos;
  }
}