import 'package:clear_tasks/features/todos/data/dto/todo_dto.dart';

abstract class TodosDataSource {
  Future<List<TodoDto>> getTodos();
  Future<void> addTodo(TodoDto todo);
  Future<void> updateTodo(TodoDto todo);
  Future<void> deleteTodo(String id);
}
