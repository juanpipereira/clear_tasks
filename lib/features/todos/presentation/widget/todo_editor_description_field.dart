import 'package:clear_tasks/core/presentation/widgets/not_empty_text_form_field.dart';
import 'package:clear_tasks/features/prompts/core/constants/prompt_constants.dart';
import 'package:clear_tasks/features/prompts/presentation/provider/prompts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoEditorDescriptionField extends ConsumerStatefulWidget {
  const TodoEditorDescriptionField({
    super.key,
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  ConsumerState<TodoEditorDescriptionField> createState() =>
      _TodoEditorDescriptionFieldState();
}

class _TodoEditorDescriptionFieldState
    extends ConsumerState<TodoEditorDescriptionField> {
  final _aiPromptController = TextEditingController();
  bool _useAiDescription = false;

  @override
  void dispose() {
    _aiPromptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promptState = ref.watch(promptsNotifierProvider);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: NotEmptyTextFormField(
                controller: widget.descriptionController,
                labelText: 'Description',
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
                NotEmptyTextFormField(
                  controller: _aiPromptController,
                  labelText: 'AI Prompt for Description',
                  maxLines: 3,
                ),
                const SizedBox(height: 8.0),
                if (promptState.isLoading)
                  const Center(child: CircularProgressIndicator.adaptive())
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
      ],
    );
  }
}
