import 'package:todo_list/models/Status.dart';

class Todo{
  Todo({required this.item, this.status = Status.incomplete,});
  final String item;
  final Status status;
}