import 'package:clear_tasks/core/domain/model/splitted_list_to_string.dart';
import 'package:clear_tasks/core/presentation/widgets/not_empty_text_form_field.dart';
import 'package:clear_tasks/features/prompts/presentation/provider/prompts_provider.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_editor_description_field.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_editor_save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoEditorForm extends ConsumerStatefulWidget {
  const TodoEditorForm({super.key, this.todo});

  final Todo? todo;

  @override
  ConsumerState<TodoEditorForm> createState() => _TodoEditorFormState();
}

class _TodoEditorFormState extends ConsumerState<TodoEditorForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _userController = TextEditingController();
  final _labelsController = TextEditingController();
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _isEditMode = true;
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
      _userController.text = widget.todo!.user;
      _labelsController.text = widget.todo!.labels.joinToString();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _userController.dispose();
    _labelsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(promptsNotifierProvider, (previous, next) {
      next.when(
        data: (response) {
          if (response != null) {
            _descriptionController.text = response.text;
          }
        },
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error generating description: $err')),
          );
        },
        loading: () {},
      );
    });

    return Form(
      key: _formKey,
      child: ListView(
        children: [
          NotEmptyTextFormField(
            controller: _titleController,
            labelText: 'Title',
            notEmptyValidatorMessage: 'Please enter a title',
          ),
          const SizedBox(height: 16.0),
          TodoEditorDescriptionField(
            descriptionController: _descriptionController,
          ),
          const SizedBox(height: 16.0),
          NotEmptyTextFormField(
            controller: _userController,
            labelText: 'User',
            notEmptyValidatorMessage: 'Please enter a user',
          ),
          const SizedBox(height: 16.0),
          NotEmptyTextFormField(
            controller: _labelsController,
            labelText: 'Labels (comma-separated)',
          ),
          const SizedBox(height: 24.0),
          TodoEditorSaveButton(
            formKey: _formKey,
            isEditMode: _isEditMode,
            todo: widget.todo,
            titleController: _titleController,
            descriptionController: _descriptionController,
            userController: _userController,
            labelsController: _labelsController,
          ),
        ],
      ),
    );
  }
}
