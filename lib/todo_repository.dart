import 'package:todo_list/models/todo.dart';

class TodoRepository {
  TodoRepository();

  final List<Todo> _todos = [
    Todo(item: 'To do 1'),
    Todo(item: 'To do 2', isCompleted: true),
    Todo(item: 'To do 3', isCompleted: false),
  ];

  List<Todo> getTodos(){
    return _todos;
  }


  List<Todo> updateTodos(int index){
    _todos[index].isCompleted = !_todos[index].isCompleted;
    return _todos;
  }

  List<Todo> addTodo(String item){
    _todos.add(Todo(item: item));

    return _todos;
  }
}