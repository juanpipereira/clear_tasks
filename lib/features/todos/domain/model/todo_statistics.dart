import 'package:clear_tasks/features/todos/domain/model/todo_statistics_by_label.dart';

class TodoStatistics {
  final int completedTodos;
  final int totalTodos;
  final List<TodoStatisticsByLabel> todoStatisticsByLabel;
  double get completedProgress =>
      totalTodos > 0 ? completedTodos / totalTodos : 0;

  const TodoStatistics({
    this.completedTodos = 0,
    this.totalTodos = 0,
    this.todoStatisticsByLabel = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoStatistics &&
          runtimeType == other.runtimeType &&
          completedTodos == other.completedTodos &&
          totalTodos == other.totalTodos &&
          todoStatisticsByLabel == other.todoStatisticsByLabel;

  @override
  int get hashCode =>
      completedTodos.hashCode ^
      totalTodos.hashCode ^
      todoStatisticsByLabel.hashCode;
}
