import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/provider/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key});

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _userController = TextEditingController();
  final _labelsController = TextEditingController();
  bool _useAiDescription = false;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
        centerTitle: true,
      ),
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
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'AI Prompt for Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
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
                    final newTodo = Todo(
                      id: DateTime.now().toIso8601String(),
                      title: _titleController.text,
                      isCompleted: false,
                      description: _descriptionController.text,
                      user: _userController.text,
                      labels: _labelsController.text
                          .split(',')
                          .map((e) => e.trim())
                          .where((s) => s.isNotEmpty)
                          .toList(),
                    );
                    ref.read(todosNotifierProvider.notifier).add(newTodo);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Todo "${newTodo.title}" created'),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
