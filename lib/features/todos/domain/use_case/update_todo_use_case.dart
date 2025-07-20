import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';

class UpdateTodoUseCase {
  final TodosRepository _repository;

  UpdateTodoUseCase(this._repository);

  Future<void> execute(Todo todo) async {
    await _repository.updateTodo(todo);
  }
}
