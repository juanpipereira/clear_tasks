import 'package:clear_tasks/features/todos/domain/model/todo_statistics.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_core_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_statistics_provider.g.dart';

@riverpod
class TodoStatisticsNotifier extends _$TodoStatisticsNotifier {
  @override
  Future<TodoStatistics> build() async {
    return ref.watch(getTodoStatisticsUseCaseProvider).execute();
  }
}
