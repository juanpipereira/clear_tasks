import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';
import 'package:clear_tasks/features/todos/domain/use_case/update_todo_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late UpdateTodoUseCase updateTodoUseCase;
  late MockTodosRepository mockTodosRepository;

  setUp(() {
    mockTodosRepository = MockTodosRepository();
    updateTodoUseCase = UpdateTodoUseCase(mockTodosRepository);
  });

  const tTodo = Todo(
    id: '1',
    title: 'Test Todo',
    isCompleted: false,
    description: 'Test Description',
    user: 'Test User',
    labels: [],
  );

  test('should call updateTodo on the repository', () async {
    // arrange
    when(() => mockTodosRepository.updateTodo(tTodo)).thenAnswer((_) async => {});
    // act
    await updateTodoUseCase.execute(tTodo);
    // assert
    verify(() => mockTodosRepository.updateTodo(tTodo)).called(1);
    verifyNoMoreInteractions(mockTodosRepository);
  });
}
