import 'package:clear_tasks/features/todos/domain/model/todo_statistics.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_statistics_provider.g.dart';

@riverpod
class TodoStatisticsNotifier extends _$TodoStatisticsNotifier {
  @override
  Future<TodoStatistics> build() async {
    await Future.delayed(Duration(seconds: 1));
    // final todosAmount = await ref.watch(
    //   todosNotifierProvider.selectAsync((todos) => todos.length),
    // );
    // final completedTodos = await ref.watch(
    //   todosNotifierProvider.selectAsync(
    //     (todos) => todos.fold<int>(
    //       0,
    //       (value, elem) => value + (elem.isCompleted ? 1 : 0),
    //     ),
    //   ),
    // );
    final todos = await ref.watch(todosNotifierProvider.future);
    final completedTodos = todos.fold<int>(
      0,
      (value, currentTodo) => value + (currentTodo.isCompleted ? 1 : 0),
    );
    final todosAmount = todos.length;

    return TodoStatistics(
      completedTodos: completedTodos,
      totalTodos: todosAmount,
    );
  }
}
