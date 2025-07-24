import 'package:clear_tasks/features/todos/domain/model/todo_statistics.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';

class GetTodoStatisticsUseCase {
  final TodosRepository _repository;

  GetTodoStatisticsUseCase(this._repository);

  Future<TodoStatistics> execute() async {
    return await _repository.getTodoStatistics();
  }
}
