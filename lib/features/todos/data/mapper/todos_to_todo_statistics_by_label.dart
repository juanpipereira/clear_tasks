import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/model/todo_statistics_by_label.dart';
import 'package:clear_tasks/features/todos/domain/model/todo_statistics_by_label_extension.dart';

extension TodosToTodoStatisticsByLabel on List<Todo> {
  List<TodoStatisticsByLabel> toTodosStatisticsByLabel() {
    final labelStatistics = <String, TodoStatisticsByLabel>{};
    for (final todo in this) {
      for (final label in todo.labels) {
        labelStatistics[label] = labelStatistics[label].increaseOrCreate(
          isCompleted: todo.isCompleted,
          label: label,
        );
      }
    }
    return labelStatistics.values.toList();
  }
}
