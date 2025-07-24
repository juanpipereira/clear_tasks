import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_core_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_provider.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  Future<List<Todo>> build() async {
    return ref.watch(getTodosUseCaseProvider).execute();
  }

  Future<void> add(Todo todo) async {
    await ref.read(addTodoUseCaseProvider).execute(todo);
    ref.invalidateSelf();
  }

  Future<void> updateTodo(Todo todo) async {
    await ref.read(updateTodoUseCaseProvider).execute(todo);
    ref.invalidateSelf();
  }

  Future<void> delete(String id) async {
    await ref.read(deleteTodoUseCaseProvider).execute(id);
    ref.invalidateSelf();
  }
}
