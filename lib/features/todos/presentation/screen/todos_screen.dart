import 'package:clear_tasks/features/todos/presentation/provider/todos_provider.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:clear_tasks/features/todos/presentation/screen/todo_editor_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TodoEditorScreen(todo: todo),
                  ));
                },
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) =>
            const Center(child: Text('Sorry, something went wrong.')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TodoEditorScreen(),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
