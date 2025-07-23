import 'package:clear_tasks/core/presentation/widgets/adaptive_scaffold.dart';
import 'package:clear_tasks/features/prompts/core/constants/prompt_constants.dart';
import 'package:clear_tasks/features/prompts/presentation/provider/prompts_provider.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoEditorScreen extends ConsumerStatefulWidget {
  const TodoEditorScreen({super.key, this.todo});

  final Todo? todo;

  @override
  ConsumerState<TodoEditorScreen> createState() => _TodoEditorScreenState();
}

class _TodoEditorScreenState extends ConsumerState<TodoEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _userController = TextEditingController();
  final _labelsController = TextEditingController();
  final _aiPromptController = TextEditingController();
  bool _useAiDescription = false;
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _isEditMode = true;
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
      _userController.text = widget.todo!.user;
      _labelsController.text = widget.todo!.labels.join(', ');
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _userController.dispose();
    _labelsController.dispose();
    _aiPromptController.dispose();
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

    final promptState = ref.watch(promptsNotifierProvider);
    final pageTitle = _isEditMode ? 'Edit Todo' : 'Add New Todo';

    return AdaptiveScaffold(
      title: pageTitle,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      enabled: !_useAiDescription,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _useAiDescription = !_useAiDescription;
                      });
                    },
                    child: Text(_useAiDescription ? 'Manual' : 'AI Prompt'),
                  ),
                ],
              ),
              if (_useAiDescription)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _aiPromptController,
                        decoration: const InputDecoration(
                          labelText: 'AI Prompt for Description',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8.0),
                      if (promptState.isLoading)
                        const Center(
                            child: CircularProgressIndicator.adaptive())
                      else
                        ElevatedButton(
                          onPressed: () {
                            if (_aiPromptController.text.isNotEmpty) {
                              final fullPrompt =
                                  PromptConstants.buildTodoDescriptionPrompt(
                                      _aiPromptController.text);
                              ref
                                  .read(promptsNotifierProvider.notifier)
                                  .makePrompt(fullPrompt);
                            }
                          },
                          child: const Text('Generate Description'),
                        ),
                    ],
                  ),
                ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _userController,
                decoration: const InputDecoration(
                  labelText: 'User',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a user';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _labelsController,
                decoration: const InputDecoration(
                  labelText: 'Labels (comma-separated)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final todo = Todo(
                      id: _isEditMode
                          ? widget.todo!.id
                          : DateTime.now().toIso8601String(),
                      title: _titleController.text,
                      isCompleted:
                          _isEditMode ? widget.todo!.isCompleted : false,
                      description: _descriptionController.text,
                      user: _userController.text,
                      labels: _labelsController.text
                          .split(',')
                          .map((e) => e.trim())
                          .where((s) => s.isNotEmpty)
                          .toList(),
                    );
                    if (_isEditMode) {
                      ref.read(todosNotifierProvider.notifier).updateTodo(todo);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Todo "${todo.title}" updated'),
                        ),
                      );
                    } else {
                      ref.read(todosNotifierProvider.notifier).add(todo);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Todo "${todo.title}" created'),
                        ),
                      );
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text(_isEditMode ? 'Update Todo' : 'Save Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
