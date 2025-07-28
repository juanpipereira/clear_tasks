import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';
import 'package:clear_tasks/features/todos/domain/use_case/add_todo_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late AddTodoUseCase addTodoUseCase;
  late MockTodosRepository mockTodosRepository;

  setUp(() {
    mockTodosRepository = MockTodosRepository();
    addTodoUseCase = AddTodoUseCase(mockTodosRepository);
  });

  const tTodo = Todo(
    id: '1',
    title: 'Test Todo',
    isCompleted: false,
    description: 'Test Description',
    user: 'Test User',
    labels: [],
  );

  test('should call addTodo on the repository', () async {
    // arrange
    when(() => mockTodosRepository.addTodo(tTodo)).thenAnswer((_) async => {});
    // act
    await addTodoUseCase.execute(tTodo);
    // assert
    verify(() => mockTodosRepository.addTodo(tTodo)).called(1);
    verifyNoMoreInteractions(mockTodosRepository);
  });
}
