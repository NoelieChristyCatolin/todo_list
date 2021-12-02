class Todo{
  Todo({required this.id, required this.item, this.isCompleted = false,});
  int id;
  String item;
  bool isCompleted;
}