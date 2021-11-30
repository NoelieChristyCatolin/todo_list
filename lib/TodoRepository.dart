import 'package:todo_list/models/todo.dart';

class TodoRepository {
  TodoRepository();

  List<Todo> getTodos(){
    List<Todo> _todos = [
      Todo(item: 'To do 1'),
      Todo(item: 'To do 2'),
      Todo(item: 'To do 3'),
      Todo(item: 'To do 4'),
      Todo(item: 'To do 5'),
      Todo(item: 'To do 6'),
    ];
    return _todos;
  }
}