import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';
import 'package:clear_tasks/features/todos/domain/use_case/delete_todo_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late DeleteTodoUseCase deleteTodoUseCase;
  late MockTodosRepository mockTodosRepository;

  setUp(() {
    mockTodosRepository = MockTodosRepository();
    deleteTodoUseCase = DeleteTodoUseCase(mockTodosRepository);
  });

  const tTodoId = '1';

  test('should call deleteTodo on the repository', () async {
    // arrange
    when(() => mockTodosRepository.deleteTodo(tTodoId)).thenAnswer((_) async => {});
    // act
    await deleteTodoUseCase.execute(tTodoId);
    // assert
    verify(() => mockTodosRepository.deleteTodo(tTodoId)).called(1);
    verifyNoMoreInteractions(mockTodosRepository);
  });
}
