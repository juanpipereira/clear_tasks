import 'package:clear_tasks/features/todos/data/data_source/todos_data_source.dart';
import 'package:clear_tasks/features/todos/data/data_source/todos_data_source_impl.dart';
import 'package:clear_tasks/features/todos/data/dto/todo_dto.dart';
import 'package:clear_tasks/features/todos/data/repository/todos_repository_impl.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/domain/repository/todos_repository.dart';
import 'package:clear_tasks/features/todos/domain/use_case/add_todo_use_case.dart';
import 'package:clear_tasks/features/todos/domain/use_case/delete_todo_use_case.dart';
import 'package:clear_tasks/features/todos/domain/use_case/get_todos_use_case.dart';
import 'package:clear_tasks/features/todos/domain/use_case/update_todo_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clear_tasks/core/constants/hive_constants.dart';

part 'todos_provider.g.dart';

@Riverpod(keepAlive: true)
Box<TodoDto> todoBox(Ref ref) {
  return Hive.box<TodoDto>(HiveConstants.todoBox);
}

@Riverpod(keepAlive: true)
TodosDataSource todosDataSource(Ref ref) {
  return TodosDataSourceImpl(ref.watch(todoBoxProvider));
}

@Riverpod(keepAlive: true)
TodosRepository todosRepository(Ref ref) {
  return TodosRepositoryImpl(ref.watch(todosDataSourceProvider));
}

@Riverpod(keepAlive: true)
GetTodosUseCase getTodosUseCase(Ref ref) {
  return GetTodosUseCase(ref.watch(todosRepositoryProvider));
}

@Riverpod(keepAlive: true)
AddTodoUseCase addTodoUseCase(Ref ref) {
  return AddTodoUseCase(ref.watch(todosRepositoryProvider));
}

@Riverpod(keepAlive: true)
UpdateTodoUseCase updateTodoUseCase(Ref ref) {
  return UpdateTodoUseCase(ref.watch(todosRepositoryProvider));
}

@Riverpod(keepAlive: true)
DeleteTodoUseCase deleteTodoUseCase(Ref ref) {
  return DeleteTodoUseCase(ref.watch(todosRepositoryProvider));
}

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
