import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';

class GetTodosUseCase {
  final TodosRepository _repository;

  GetTodosUseCase(this._repository);

  Future<List<Todo>> execute() async {
    return await _repository.getTodos();
  }
}
