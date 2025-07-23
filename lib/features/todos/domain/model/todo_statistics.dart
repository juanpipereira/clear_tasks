class TodoStatistics {
  final int completedTodos;
  final int totalTodos;
  double get completedProgress => completedTodos / totalTodos;

  const TodoStatistics({
    this.completedTodos = 0,
    this.totalTodos = 0,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoStatistics &&
          runtimeType == other.runtimeType &&
          completedTodos == other.completedTodos &&
          totalTodos == other.totalTodos;

  @override
  int get hashCode => completedTodos.hashCode ^ totalTodos.hashCode;
}
