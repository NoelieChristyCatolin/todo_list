import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_list/data/todo_repository.dart';

import 'todo_cubit_test.mocks.dart';

@GenerateMocks([
  TodoRepository,
])
void main(){
  TodoRepository _todoRepository;

  setUp((){
    _todoRepository = MockTodoRepository();
  });

  test('getTodos',(){});

  test('updateTodos',(){});

  test('addTodos',(){});


}