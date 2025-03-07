
class TodoEntity {
  final int id;
  final String title;
  final bool isCompleted;

  TodoEntity({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}
