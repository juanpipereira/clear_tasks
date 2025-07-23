import 'package:clear_tasks/core/presentation/widgets/adaptive_scaffold.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todo_statistics_provider.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_statistics_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoStatisticsScreen extends ConsumerWidget {
  const TodoStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statistics = ref.watch(todoStatisticsNotifierProvider);
    return AdaptiveScaffold(
      title: 'Statistics',
      body: statistics.when(
        data: (statistics) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TodoStatisticsBar(
                    value: statistics.completedProgress,
                    title:
                        'Completed Tasks: ${statistics.completedTodos} / ${statistics.totalTodos}',
                  ),
                ],
              ),
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
