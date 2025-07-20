class Todo {
  final String id;
  final String title;
  final bool isCompleted;
  final String description;
  final String user;
  final List<String> labels;

  const Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.description,
    required this.user,
    required this.labels,
  });
}
