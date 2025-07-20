import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';

class DeleteTodoUseCase {
  final TodosRepository _repository;

  DeleteTodoUseCase(this._repository);

  Future<void> execute(String id) async {
    await _repository.deleteTodo(id);
  }
}
