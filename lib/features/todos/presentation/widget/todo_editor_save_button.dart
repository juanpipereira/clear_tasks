import 'package:clear_tasks/core/domain/model/string_split_to_list.dart';
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
          final title = titleController.text;
          final description = descriptionController.text;
          final user = userController.text;
          final labels = labelsController.text.splitToList();
          if (isEditMode && todo != null) {
            final newTodo = todo!.copyWith(
              title: title,
              user: user,
              description: description,
              labels: labels,
            );
            ref.read(todosNotifierProvider.notifier).updateTodo(newTodo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Todo "$title" updated'),
              ),
            );
          } else {
            ref.read(todosNotifierProvider.notifier).add(
                  title: title,
                  user: user,
                  description: description,
                  labelsSet: labels,
                );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Todo "$title" created'),
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
