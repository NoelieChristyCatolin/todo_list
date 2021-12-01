import 'package:localstorage/localstorage.dart';
import 'package:todo_list/domain/models/todo.dart';

class TodoRepository {
  TodoRepository();

  static String storageName = 'TodoStorage';
  static String todos = 'todos';
  final LocalStorage storage = LocalStorage(storageName);
  List<Todo> _todos = [];

  List<Todo> getTodos(){
    _todos = storage.getItem(todos) ?? [];
    return _todos;
  }


  List<Todo> updateTodos(int index){
    _todos[index].isCompleted = !_todos[index].isCompleted;
    storage.setItem(todos, _todos);
    return _todos;
  }

  List<Todo> addTodo(String item){
    _todos.add(Todo(item: item));
    storage.setItem(todos, _todos);
    return _todos;
  }
}