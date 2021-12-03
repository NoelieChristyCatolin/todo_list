import 'package:localstorage/localstorage.dart';
import 'package:todo_list/domain/models/todo.dart';

class TodoRepository {
  TodoRepository({required this.storage});

  static String todosStorage = 'todos';

  final LocalStorage storage;
  List<Todo> todos = [];

  //Get lsit of todo's from the local storage
  List<Todo> getTodos(){
    todos = storage.getItem(todosStorage) ?? <Todo>[];
    return todos;
  }

  //search the object from the list
  //reverse the status if completed or not
  //updates the value of the list in the local storage
  List<Todo> updateTodos(Todo todo){
    int index = todos.indexOf(todo);
    todos[index].isCompleted = !todos[index].isCompleted;
    storage.setItem(todosStorage, todos);
    return todos;
  }

  //Adds a new todo to the list
  //uses the lenth + 1 for the id of the new todo
  //updates the value of the list in the local storage
  List<Todo> addTodo(String item){
    todos.add(Todo(id: todos.length + 1, item: item));
    storage.setItem(todosStorage, todos);
    return todos;
  }
}