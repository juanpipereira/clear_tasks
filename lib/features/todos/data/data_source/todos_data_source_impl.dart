import 'package:clear_tasks/features/todos/data/data_source/todos_data_source.dart';
import 'package:clear_tasks/features/todos/data/dto/todo_dto.dart';
import 'package:hive/hive.dart';

class TodosDataSourceImpl implements TodosDataSource {
  final Box<TodoDto> _box;

  TodosDataSourceImpl(this._box);

  @override
  Future<List<TodoDto>> getTodos() async {
    return _box.values.toList();
  }

  @override
  Future<void> addTodo(TodoDto todo) async {
    await _box.put(todo.id, todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _box.delete(id);
  }

  @override
  Future<void> updateTodo(TodoDto todo) async {
    await _box.put(todo.id, todo);
  }
}
