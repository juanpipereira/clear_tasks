import 'package:clear_tasks/features/todos/domain/model/todo_statistics_by_label.dart';

extension TodoStatisticsByLabelExtension on TodoStatisticsByLabel? {
  TodoStatisticsByLabel increaseOrCreate({
    required bool isCompleted,
    required String label,
  }) {
    return this?.increaseIfCompleted(isCompleted) ??
        TodoStatisticsByLabel(
          label: label,
          count: 1,
          completedCount: isCompleted ? 1 : 0,
        );
  }
}
