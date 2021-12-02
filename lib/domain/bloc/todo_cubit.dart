import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/bloc/todo_state.dart';
import 'package:todo_list/domain/models/todo.dart';
import 'package:todo_list/data/todo_repository.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required this.todoRepository}) : super(TodoState());

  final TodoRepository todoRepository;

  void getTodos({bool? isCompleted}){
    List<Todo> todos = todoRepository.getTodos();
    List<Todo> filteredList = [];

    if(isCompleted == null){
      filteredList = todos;
    }
    else {
      for (var element in todos) {
        if(element.isCompleted == isCompleted){
          filteredList.add(element);
        }
      }
    }

    emit(state.copyWith(todos: filteredList));
  }

  void updatedTodoStatus(Todo todo){
    List<Todo> todos = todoRepository.updateTodos(todo);
    emit(state.copyWith(todos: todos));
  }

  void addTodo(String item){
    List<Todo> todos = todoRepository.addTodo(item);
    emit(state.copyWith(todos: todos));
  }


}