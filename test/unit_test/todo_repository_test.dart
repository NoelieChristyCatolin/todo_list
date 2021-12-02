import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_list/data/todo_repository.dart';
import 'package:todo_list/domain/models/todo.dart';

import 'todo_repository_test.mocks.dart';

@GenerateMocks([
  LocalStorage,
])
void main(){
  late LocalStorage _localStorage;
  late TodoRepository _todoRepository;
  List<Todo> todos = [
    Todo(id: 1, item: 'item 1'),
    Todo(id: 2, item: 'item 2', isCompleted: true),
    Todo(id: 3, item: 'item 3', isCompleted: false),
  ];

  setUp((){
    _localStorage = MockLocalStorage();
    _todoRepository = TodoRepository(storage: _localStorage);
    _todoRepository.todos = todos;
  });

  // test('getTodos', (){
  //   when(_localStorage.getItem('todo')).thenReturn(todos);
  //
  //   List<Todo> todosResult = _todoRepository.getTodos();
  //
  //   verify(_localStorage.getItem('todo')).called(1);
  //   expect(todosResult, todos);
  // });

  test('updateTodos', (){
    _todoRepository.todos = todos;
    List<Todo> todosResult = _todoRepository.updateTodos(todos[2]);

    expect(todosResult[2].isCompleted, true);
  });

  test('addTodo', (){
    List<Todo> todosResult = _todoRepository.addTodo('Item 4');

    expect(todosResult.length, 4);
  });
}