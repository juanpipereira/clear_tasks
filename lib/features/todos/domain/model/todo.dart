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

  Todo copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    String? description,
    String? user,
    List<String>? labels,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      description: description ?? this.description,
      user: user ?? this.user,
      labels: labels ?? this.labels,
    );
  }
}
