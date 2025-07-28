import 'package:clear_tasks/features/todos/domain/model/todo_statistics.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';
import 'package:clear_tasks/features/todos/domain/use_case/get_todo_statistics_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late GetTodoStatisticsUseCase getTodoStatisticsUseCase;
  late MockTodosRepository mockTodosRepository;

  setUp(() {
    mockTodosRepository = MockTodosRepository();
    getTodoStatisticsUseCase = GetTodoStatisticsUseCase(mockTodosRepository);
  });

  const tTodoStatistics = TodoStatistics(
    totalTodos: 2,
    completedTodos: 1,
  );

  test('should get todo statistics from the repository', () async {
    // arrange
    when(() => mockTodosRepository.getTodoStatistics()).thenAnswer((_) async => tTodoStatistics);
    // act
    final result = await getTodoStatisticsUseCase.execute();
    // assert
    expect(result, tTodoStatistics);
    verify(() => mockTodosRepository.getTodoStatistics()).called(1);
    verifyNoMoreInteractions(mockTodosRepository);
  });
}
