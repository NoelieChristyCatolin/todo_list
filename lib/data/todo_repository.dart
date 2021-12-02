import 'package:localstorage/localstorage.dart';
import 'package:todo_list/domain/models/todo.dart';

class TodoRepository {
  TodoRepository({required this.storage});

  static String todosStorage = 'todos';

  final LocalStorage storage;
  List<Todo> todos = [];

  List<Todo> getTodos(){
    todos = storage.getItem(todosStorage) ?? <Todo>[];
    return todos;
  }

  List<Todo> updateTodos(Todo todo){
    int index = todos.indexOf(todo);
    todos[index].isCompleted = !todos[index].isCompleted;
    storage.setItem(todosStorage, todos);
    return todos;
  }

  List<Todo> addTodo(String item){
    todos.add(Todo(id: todos.length + 1, item: item));
    storage.setItem(todosStorage, todos);
    return todos;
  }
}