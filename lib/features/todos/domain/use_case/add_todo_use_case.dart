import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';

class AddTodoUseCase {
  final TodosRepository _repository;

  AddTodoUseCase(this._repository);

  Future<void> execute(Todo todo) async {
    await _repository.addTodo(todo);
  }
}
