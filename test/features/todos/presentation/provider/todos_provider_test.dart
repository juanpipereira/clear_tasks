import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/use_case/add_todo_use_case.dart';
import 'package:clear_tasks/features/todos/domain/use_case/delete_todo_use_case.dart';
import 'package:clear_tasks/features/todos/domain/use_case/get_todos_use_case.dart';
import 'package:clear_tasks/features/todos/domain/use_case/update_todo_use_case.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_core_providers.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTodosUseCase extends Mock implements GetTodosUseCase {}

class MockAddTodoUseCase extends Mock implements AddTodoUseCase {}

class MockUpdateTodoUseCase extends Mock implements UpdateTodoUseCase {}

class MockDeleteTodoUseCase extends Mock implements DeleteTodoUseCase {}

void main() {
  late MockGetTodosUseCase mockGetTodosUseCase;
  late MockAddTodoUseCase mockAddTodoUseCase;
  late MockUpdateTodoUseCase mockUpdateTodoUseCase;
  late MockDeleteTodoUseCase mockDeleteTodoUseCase;
  late ProviderContainer container;

  const tTodo = Todo(
    id: '1',
    title: 'Test Todo',
    isCompleted: false,
    description: 'Description',
    user: 'User',
    labels: ['test', 'label'],
  );

  setUp(() {
    mockGetTodosUseCase = MockGetTodosUseCase();
    mockAddTodoUseCase = MockAddTodoUseCase();
    mockUpdateTodoUseCase = MockUpdateTodoUseCase();
    mockDeleteTodoUseCase = MockDeleteTodoUseCase();

    registerFallbackValue(tTodo);

    container = ProviderContainer(
      overrides: [
        getTodosUseCaseProvider.overrideWithValue(mockGetTodosUseCase),
        addTodoUseCaseProvider.overrideWithValue(mockAddTodoUseCase),
        updateTodoUseCaseProvider.overrideWithValue(mockUpdateTodoUseCase),
        deleteTodoUseCaseProvider.overrideWithValue(mockDeleteTodoUseCase),
      ],
    );
  });

  group('TodosNotifier', () {
    test('build retrieves the initial list of todos', () async {
      // Arrange
      when(() => mockGetTodosUseCase.execute())
          .thenAnswer((_) async => [tTodo]);

      // Act
      final result = await container.read(todosNotifierProvider.future);

      // Assert
      expect(result, [tTodo]);
      verify(() => mockGetTodosUseCase.execute()).called(1);
    });

    test('add calls the use case and invalidates the state', () async {
      // Arrange
      when(() => mockAddTodoUseCase.execute(any())).thenAnswer((_) async => {});
      when(() => mockGetTodosUseCase.execute())
          .thenAnswer((_) async => [tTodo]);
      // Act
      await container.read(todosNotifierProvider.notifier).add(
        title: 'New Todo',
        user: 'Test User',
        description: 'Test Description',
        labelsSet: ['test', 'label'],
      );

      // Assert
      verify(() => mockAddTodoUseCase.execute(any())).called(1);
      verify(() => mockGetTodosUseCase.execute()).called(1);
    });

    test('update calls the use case and invalidates the state', () async {
      // Arrange
      when(() => mockUpdateTodoUseCase.execute(any()))
          .thenAnswer((_) async => {});
      when(() => mockGetTodosUseCase.execute())
          .thenAnswer((_) async => [tTodo]);

      // Act
      await container.read(todosNotifierProvider.notifier).updateTodo(tTodo);

      // Assert
      verify(() => mockUpdateTodoUseCase.execute(tTodo)).called(1);
      verify(() => mockGetTodosUseCase.execute()).called(1);
    });

    test('delete calls the use case and invalidates the state', () async {
      // Arrange
      when(() => mockDeleteTodoUseCase.execute(any()))
          .thenAnswer((_) async => {});
      when(() => mockGetTodosUseCase.execute()).thenAnswer((_) async => []);

      // Act
      await container.read(todosNotifierProvider.notifier).delete(tTodo.id);

      // Assert
      verify(() => mockDeleteTodoUseCase.execute(tTodo.id)).called(1);
      verify(() => mockGetTodosUseCase.execute()).called(1);
    });
  });
}
