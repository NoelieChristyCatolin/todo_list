import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/todo_repository.dart';
import 'package:todo_list/bloc/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required this.todoRepository}) : super(TodoState());

  final TodoRepository todoRepository;

  List<Todo> getTodos({bool? isCompletted}){
    List<Todo> todos = todoRepository.getTodos();
    List<Todo> filteredList = [];

    if(isCompletted == null){
      filteredList = todos;
    }
    else {
      todos.forEach((element) {
        if(element.isCompleted == isCompletted){
          filteredList.add(element);
        }
      });
    }

    emit(state.copyWith(todos: filteredList));
    return filteredList;
  }

  void updatedTodoStatus(int index){
    List<Todo> todos =todoRepository.updateTodos(index);
    emit(state.copyWith(todos: todos));
  }

  void addTodo(String item){
    List<Todo> todos = todoRepository.addTodo(item);
    emit(state.copyWith(todos: todos));
  }


}