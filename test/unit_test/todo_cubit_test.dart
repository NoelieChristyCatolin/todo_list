import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_list/data/todo_repository.dart';
import 'package:todo_list/domain/bloc/todo_cubit.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/domain/models/todo.dart';

import 'todo_cubit_test.mocks.dart';

@GenerateMocks([
  TodoRepository,
])
void main(){
  late TodoRepository _todoRepository;
  late TodoCubit _todoCubit;
  List<Todo> todos = [
    Todo(id: 1, item: 'item 1'),
    Todo(id: 2, item: 'item 2', isCompleted: true),
    Todo(id: 3, item: 'item 3', isCompleted: false),
  ];

  setUp((){
    _todoRepository = MockTodoRepository();
    _todoCubit = TodoCubit(todoRepository: _todoRepository);
  });

  test('getTodos - All',(){
    when(_todoRepository.getTodos()).thenReturn(todos);

    _todoCubit.getTodos();

    verify(_todoRepository.getTodos()).called(1);
    expect(_todoCubit.state.todos.length, 3);
  });

  test('getTodos - Completed',(){
    when(_todoRepository.getTodos()).thenReturn(todos);

    _todoCubit.getTodos(isCompleted: true);

    verify(_todoRepository.getTodos()).called(1);
    expect(_todoCubit.state.todos.length, 1);
  });

  test('getTodos - incompleted',(){
    when(_todoRepository.getTodos()).thenReturn(todos);

    _todoCubit.getTodos(isCompleted: false);

    verify(_todoRepository.getTodos()).called(1);
    expect(_todoCubit.state.todos.length, 2);
  });

  test('updateTodos',(){
    todos[2].isCompleted = !todos[2].isCompleted;
    when(_todoRepository.updateTodos(todos[2])).thenReturn(todos);

    _todoCubit.updatedTodoStatus(todos[2]);

    verify(_todoRepository.updateTodos(todos[2])).called(1);
    expect(_todoCubit.state.todos.length, 3);
    expect(_todoCubit.state.todos, todos);
  });

  test('addTodos',(){
    String newTask = 'item 4';
    Todo newTodo = Todo(id: todos.length + 1, item: newTask);
    todos.add(newTodo);
    when(_todoRepository.addTodo(newTask)).thenReturn(todos);

    _todoCubit.addTodo(newTask);

    verify(_todoRepository.addTodo(newTask)).called(1);
    expect(_todoCubit.state.todos.length, 4);
    expect(_todoCubit.state.todos.last.item, newTask);
  });


}