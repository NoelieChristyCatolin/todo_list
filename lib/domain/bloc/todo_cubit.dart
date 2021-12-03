import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/bloc/todo_state.dart';
import 'package:todo_list/domain/models/todo.dart';
import 'package:todo_list/data/todo_repository.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required this.todoRepository}) : super(TodoState());

  final TodoRepository todoRepository;

  //get the list of todos
  //filters the list according to the parameters value,
  //null returns all todos
  //true returns all completed items
  //false returns all incompleted items
  //updates the state value
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

  //updates the the status of the selected todo from incomplete to complete vice versa
  //updates the state value
  void updatedTodoStatus(Todo todo){
    List<Todo> todos = todoRepository.updateTodos(todo);
    emit(state.copyWith(todos: todos));
  }

  //add the a new todo to the list
  //updates the state value
  void addTodo(String todo){
    List<Todo> todos = todoRepository.addTodo(todo);
    emit(state.copyWith(todos: todos));
  }


}