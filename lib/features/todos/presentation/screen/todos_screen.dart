import 'dart:io' show Platform;
import 'package:clear_tasks/core/navigation/navigation_extension.dart';
import 'package:clear_tasks/core/presentation/widgets/adaptive_scaffold.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_provider.dart';
import 'package:clear_tasks/features/todos/presentation/screen/todo_statistics_screen.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clear_tasks/features/todos/presentation/screen/todo_editor_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  void _navigateToEditor(BuildContext context, {Todo? todo}) {
    final page = TodoEditorScreen(todo: todo);
    context.adaptivePush(page);
  }

  void _navigateToStatistics(BuildContext context) {
    context.adaptivePush(const TodoStatisticsScreen());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosNotifierProvider);

    return AdaptiveScaffold(
      title: 'Todos',
      body: todos.when(
        data: (todoList) {
          if (todoList.isEmpty) {
            return const Center(
              child: Text('No todos yet.'),
            );
          }
          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final todo = todoList[index];
              return TodoListTile(
                todo: todo,
                onTap: () => _navigateToEditor(context, todo: todo),
                onDelete: () {
                  ref.read(todosNotifierProvider.notifier).delete(todo.id);
                },
                onToggleComplete: (value) {
                  ref
                      .read(todosNotifierProvider.notifier)
                      .updateTodo(todo.copyWith(isCompleted: value));
                },
              );
            },
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
        error: (_, __) =>
            const Center(child: Text('Sorry, something went wrong.')),
      ),
      appBarAction: Platform.isIOS
          ? CupertinoButton(
              onPressed: () => _navigateToStatistics(context),
              child: const Icon(CupertinoIcons.chart_bar_alt_fill),
            )
          : IconButton(
              onPressed: () => _navigateToStatistics(context),
              icon: const Icon(Icons.bar_chart),
            ),
      iosAction: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => _navigateToEditor(context),
        child: const Icon(CupertinoIcons.add),
      ),
      androidAction: FloatingActionButton(
        onPressed: () => _navigateToEditor(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
