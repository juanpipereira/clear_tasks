import 'package:clear_tasks/features/todos/data/data_source/todos_data_source.dart';
import 'package:clear_tasks/features/todos/data/mapper/todo_dto_to_model.dart';
import 'package:clear_tasks/features/todos/data/mapper/todo_to_dto.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodosDataSource _dataSource;

  TodosRepositoryImpl(this._dataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final todoDtos = await _dataSource.getTodos();
    return todoDtos.map((dto) => dto.toModel()).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await _dataSource.addTodo(todo.toDto());
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _dataSource.deleteTodo(id);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await _dataSource.updateTodo(todo.toDto());
  }
}
