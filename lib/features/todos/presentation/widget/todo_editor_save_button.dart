import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoEditorSaveButton extends ConsumerWidget {
  const TodoEditorSaveButton({
    super.key,
    required this.formKey,
    required this.isEditMode,
    this.todo,
    required this.titleController,
    required this.descriptionController,
    required this.userController,
    required this.labelsController,
  });

  final GlobalKey<FormState> formKey;
  final bool isEditMode;
  final Todo? todo;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController userController;
  final TextEditingController labelsController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final newTodo = Todo(
            id: isEditMode
                ? todo!.id
                : DateTime.now().toIso8601String(),
            title: titleController.text,
            isCompleted: isEditMode ? todo!.isCompleted : false,
            description: descriptionController.text,
            user: userController.text,
            labels: labelsController.text
                .split(',')
                .map((e) => e.trim())
                .where((s) => s.isNotEmpty)
                .toList(),
          );
          if (isEditMode) {
            ref.read(todosNotifierProvider.notifier).updateTodo(newTodo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Todo "${newTodo.title}" updated'),
              ),
            );
          } else {
            ref.read(todosNotifierProvider.notifier).add(newTodo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Todo "${newTodo.title}" created'),
              ),
            );
          }
          Navigator.of(context).pop();
        }
      },
      child: Text(isEditMode ? 'Update Todo' : 'Save Todo'),
    );
  }
}
