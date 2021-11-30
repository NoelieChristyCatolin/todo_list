import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/todo_repository.dart';
import 'package:todo_list/bloc/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required this.todoRepository}) : super(TodoState()){
    // getTodos(isCompletted: isCompletted);
  }

  final TodoRepository todoRepository;
  // final bool? isCompletted;

  List<Todo> getTodos({bool? isCompletted}){
    print(isCompletted);
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

  // void getTodos(){
  //   emit(state.copyWith(todos: todoRepository.getTodos()));
  // }

  void updatedTodoStatus(int index){
    emit(state.copyWith(todos: todoRepository.updateTodos(index)));
  }


}