import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';
import 'package:clear_tasks/features/todos/domain/use_case/get_todos_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late GetTodosUseCase getTodosUseCase;
  late MockTodosRepository mockTodosRepository;

  setUp(() {
    mockTodosRepository = MockTodosRepository();
    getTodosUseCase = GetTodosUseCase(mockTodosRepository);
  });

  const tTodos = [
    Todo(
      id: '1',
      title: 'Test Todo 1',
      isCompleted: false,
      description: 'Test Description 1',
      user: 'Test User 1',
      labels: [],
    ),
    Todo(
      id: '2',
      title: 'Test Todo 2',
      isCompleted: true,
      description: 'Test Description 2',
      user: 'Test User 2',
      labels: [],
    ),
  ];

  test('should get todos from the repository', () async {
    // arrange
    when(() => mockTodosRepository.getTodos()).thenAnswer((_) async => tTodos);
    // act
    final result = await getTodosUseCase.execute();
    // assert
    expect(result, tTodos);
    verify(() => mockTodosRepository.getTodos()).called(1);
    verifyNoMoreInteractions(mockTodosRepository);
  });
}
