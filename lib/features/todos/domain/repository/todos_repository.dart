import 'package:clear_tasks/features/todos/domain/model/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
}
