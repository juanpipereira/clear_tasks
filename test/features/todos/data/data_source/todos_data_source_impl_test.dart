import 'package:clear_tasks/features/todos/data/data_source/todos_data_source_impl.dart';
import 'package:clear_tasks/features/todos/data/dto/todo_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockBox extends Mock implements Box<TodoDto> {}

void main() {
  late TodosDataSourceImpl dataSource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = TodosDataSourceImpl(mockBox);
    registerFallbackValue(TodoDto(
      id: '1',
      title: 'Test Todo',
      isCompleted: false,
      description: 'Description',
      user: 'User',
      labels: [],
    ));
  });

  final tTodoDto = TodoDto(
    id: '1',
    title: 'Test Todo',
    isCompleted: false,
    description: 'Description',
    user: 'User',
    labels: [],
  );

  group('TodosDataSourceImpl', () {
    test('getTodos returns a list of todos from the box', () async {
      // Arrange
      when(() => mockBox.values).thenReturn([tTodoDto]);

      // Act
      final result = await dataSource.getTodos();

      // Assert
      expect(result, [tTodoDto]);
      verify(() => mockBox.values).called(1);
    });

    test('addTodo calls box.put with the correct key and value', () async {
      // Arrange
      when(() => mockBox.put(any(), any())).thenAnswer((_) async => {});

      // Act
      await dataSource.addTodo(tTodoDto);

      // Assert
      verify(() => mockBox.put(tTodoDto.id, tTodoDto)).called(1);
    });

    test('deleteTodo calls box.delete with the correct key', () async {
      // Arrange
      when(() => mockBox.delete(any())).thenAnswer((_) async => {});

      // Act
      await dataSource.deleteTodo(tTodoDto.id);

      // Assert
      verify(() => mockBox.delete(tTodoDto.id)).called(1);
    });

    test('updateTodo calls box.put with the correct key and value', () async {
      // Arrange
      when(() => mockBox.put(any(), any())).thenAnswer((_) async => {});

      // Act
      await dataSource.updateTodo(tTodoDto);

      // Assert
      verify(() => mockBox.put(tTodoDto.id, tTodoDto)).called(1);
    });
  });
}
