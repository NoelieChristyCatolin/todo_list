import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/TodoRepository.dart';
import 'package:todo_list/bloc/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required this.todoRepository}) : super(TodoState()){
    getTodos();
  }

  final TodoRepository todoRepository;

  void getTodos(){
    emit(state.copyWith(todos: todoRepository.getTodos()));
  }

}