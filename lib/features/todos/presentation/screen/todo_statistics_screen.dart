import 'package:clear_tasks/core/presentation/widgets/adaptive_scaffold.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todo_statistics_provider.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_statistics_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoStatisticsScreen extends ConsumerWidget {
  const TodoStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoStatistics = ref.watch(todoStatisticsNotifierProvider);
    return AdaptiveScaffold(
      title: 'Statistics',
      body: todoStatistics.when(
        data: (statistics) {
          final todosLabels = statistics.todoStatisticsByLabel;
          final totalTodos = statistics.totalTodos;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomScrollView(
              slivers: [
                PinnedHeaderSliver(
                  child: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: TodoStatisticsBar(
                        value: statistics.completedProgress,
                        title:
                            'Completed Tasks: ${statistics.completedTodos} / $totalTodos',
                        color: Colors.green.shade400,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      'Completed tasks by label',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SliverList.separated(
                  itemCount: todosLabels.length,
                  itemBuilder: (_, i) {
                    final currentTodoLabel = todosLabels[i];
                    return TodoStatisticsBar(
                      value: currentTodoLabel.completedProgress,
                      title: currentTodoLabel.label,
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 80),
                ),
              ],
            ),
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
