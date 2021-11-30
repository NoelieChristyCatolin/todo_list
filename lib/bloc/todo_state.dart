import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/models/todo.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    @Default([]) List<Todo> todos,
  }) = _TodoState;
}