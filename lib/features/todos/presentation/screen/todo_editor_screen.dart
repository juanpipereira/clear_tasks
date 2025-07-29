import 'package:clear_tasks/core/presentation/widgets/adaptive_scaffold.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_editor_form.dart';
import 'package:flutter/material.dart';

class TodoEditorScreen extends StatelessWidget {
  const TodoEditorScreen({super.key, this.todo});

  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    final pageTitle = todo != null ? 'Edit Todo' : 'Add New Todo';

    return AdaptiveScaffold(
      title: pageTitle,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TodoEditorForm(todo: todo),
      ),
    );
  }
}
