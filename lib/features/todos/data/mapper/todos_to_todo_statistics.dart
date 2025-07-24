import 'package:clear_tasks/features/todos/data/mapper/todos_to_todo_statistics_by_label.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/model/todo_statistics.dart';

extension TodosToTodoStatistics on List<Todo> {
  TodoStatistics toTodoStatistics() {
    final completedTodos = fold<int>(
      0,
      (value, currentTodo) => value + (currentTodo.isCompleted ? 1 : 0),
    );
    final todosAmount = length;
    final todoStatisticsByLabel = toTodosStatisticsByLabel();

    return TodoStatistics(
      completedTodos: completedTodos,
      totalTodos: todosAmount,
      todoStatisticsByLabel: todoStatisticsByLabel,
    );
  }
}
