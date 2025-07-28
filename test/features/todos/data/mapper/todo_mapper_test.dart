import 'package:clear_tasks/features/todos/data/dto/todo_dto.dart';
import 'package:clear_tasks/features/todos/data/mapper/todo_dto_to_model.dart';
import 'package:clear_tasks/features/todos/data/mapper/todo_to_dto.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo Mapper', () {
    const tTodo = Todo(
      id: '1',
      title: 'Test Todo',
      isCompleted: false,
      description: 'Description',
      user: 'User',
      labels: ['Label1'],
    );

    final tTodoDto = TodoDto(
      id: '1',
      title: 'Test Todo',
      isCompleted: false,
      description: 'Description',
      user: 'User',
      labels: ['Label1'],
    );

    test('should map Todo to TodoDto', () {
      // Act
      final result = tTodo.toDto();

      // Assert
      expect(result, isA<TodoDto>());
      expect(result.id, tTodo.id);
      expect(result.title, tTodo.title);
      expect(result.isCompleted, tTodo.isCompleted);
      expect(result.description, tTodo.description);
      expect(result.user, tTodo.user);
      expect(result.labels, tTodo.labels);
    });

    test('should map TodoDto to Todo', () {
      // Act
      final result = tTodoDto.toModel();

      // Assert
      expect(result, isA<Todo>());
      expect(result.id, tTodoDto.id);
      expect(result.title, tTodoDto.title);
      expect(result.isCompleted, tTodoDto.isCompleted);
      expect(result.description, tTodoDto.description);
      expect(result.user, tTodoDto.user);
      expect(result.labels, tTodoDto.labels);
    });
  });
}
