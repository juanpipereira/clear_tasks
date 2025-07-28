import 'package:clear_tasks/features/todos/data/mapper/todos_to_todo_statistics.dart';
import 'package:clear_tasks/features/todos/data/mapper/todos_to_todo_statistics_by_label.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/model/todo_statistics.dart';
import 'package:clear_tasks/features/todos/domain/model/todo_statistics_by_label.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo Statistics Mapper', () {
    const todos = [
      Todo(
        id: '1',
        title: 'Todo 1',
        isCompleted: true,
        description: '',
        user: '',
        labels: ['Work', 'Urgent'],
      ),
      Todo(
        id: '2',
        title: 'Todo 2',
        isCompleted: false,
        description: '',
        user: '',
        labels: ['Personal'],
      ),
      Todo(
        id: '3',
        title: 'Todo 3',
        isCompleted: true,
        description: '',
        user: '',
        labels: ['Work'],
      ),
    ];

    test('should map list of todos to TodoStatistics', () {
      // Act
      final result = todos.toTodoStatistics();

      // Assert
      expect(result, isA<TodoStatistics>());
      expect(result.completedTodos, 2);
      expect(result.totalTodos, 3);
      expect(result.todoStatisticsByLabel.length, 3);
    });

    test('should map list of todos to list of TodoStatisticsByLabel', () {
      // Act
      final result = todos.toTodosStatisticsByLabel();

      // Assert
      expect(result, isA<List<TodoStatisticsByLabel>>());
      expect(result.length, 3);

      final workStats = result.firstWhere((s) => s.label == 'Work');
      expect(workStats.count, 2);
      expect(workStats.completedCount, 2);

      final urgentStats = result.firstWhere((s) => s.label == 'Urgent');
      expect(urgentStats.count, 1);
      expect(urgentStats.completedCount, 1);

      final personalStats = result.firstWhere((s) => s.label == 'Personal');
      expect(personalStats.count, 1);
      expect(personalStats.completedCount, 0);
    });
  });
}
