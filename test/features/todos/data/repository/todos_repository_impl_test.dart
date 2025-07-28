import 'package:clear_tasks/features/todos/data/dto/todo_dto.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clear_tasks/features/todos/data/data_source/todos_data_source.dart';
import 'package:clear_tasks/features/todos/data/repository/todos_repository_impl.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';

class MockTodosDataSource extends Mock implements TodosDataSource {}

void main() {
  late TodosRepository repository;
  late MockTodosDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockTodosDataSource();
    repository = TodosRepositoryImpl(mockDataSource);
    registerFallbackValue(TodoDto(
      id: '1',
      title: 'Test Todo',
      isCompleted: false,
      description: 'Description',
      user: 'User',
      labels: [],
    ));
  });

  group('TodosRepositoryImpl', () {
    const tTodo = Todo(
      id: '1',
      title: 'Test Todo',
      isCompleted: false,
      description: 'Description',
      user: 'User',
      labels: [],
    );

    final tTodoDto = TodoDto(
      id: '1',
      title: 'Test Todo',
      isCompleted: false,
      description: 'Description',
      user: 'User',
      labels: [],
    );

    test('getTodos returns a list of todos', () async {
      // Arrange
      when(() => mockDataSource.getTodos()).thenAnswer((_) async => [tTodoDto]);

      // Act
      final result = await repository.getTodos();

      // Assert
      expect(result, isA<List<Todo>>());
      expect(result.first.id, tTodo.id);
      verify(() => mockDataSource.getTodos()).called(1);
    });

    test('addTodo calls dataSource.addTodo', () async {
      // Arrange
      when(() => mockDataSource.addTodo(any())).thenAnswer((_) async => {});

      // Act
      await repository.addTodo(tTodo);

      // Assert
      verify(() => mockDataSource.addTodo(any(that: predicate((dto) {
            final todoDto = dto as TodoDto;
            return todoDto.id == tTodo.id && todoDto.title == tTodo.title;
          })))).called(1);
    });

    test('deleteTodo calls dataSource.deleteTodo', () async {
      // Arrange
      when(() => mockDataSource.deleteTodo(any())).thenAnswer((_) async => {});

      // Act
      await repository.deleteTodo(tTodo.id);

      // Assert
      verify(() => mockDataSource.deleteTodo(tTodo.id)).called(1);
    });

    test('updateTodo calls dataSource.updateTodo', () async {
      // Arrange
      when(() => mockDataSource.updateTodo(any())).thenAnswer((_) async => {});

      // Act
      await repository.updateTodo(tTodo);

      // Assert
      verify(() => mockDataSource.updateTodo(any(that: predicate((dto) {
            final todoDto = dto as TodoDto;
            return todoDto.id == tTodo.id && todoDto.title == tTodo.title;
          })))).called(1);
    });

    test('getTodoStatistics returns correct statistics', () async {
      // Arrange
      final todos = [
        TodoDto(
            id: '1',
            title: 'Completed',
            isCompleted: true,
            description: '',
            user: '',
            labels: []),
        TodoDto(
            id: '2',
            title: 'Incomplete',
            isCompleted: false,
            description: '',
            user: '',
            labels: []),
      ];
      when(() => mockDataSource.getTodos()).thenAnswer((_) async => todos);

      // Act
      final result = await repository.getTodoStatistics();

      // Assert
      expect(result.completedTodos, 1);
      expect(result.totalTodos - result.completedTodos, 1); // Incomplete
      verify(() => mockDataSource.getTodos()).called(1);
    });
  });
}
