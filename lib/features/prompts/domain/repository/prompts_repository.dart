import 'package:clear_tasks/features/prompts/domain/model/prompt_response.dart';

abstract class PromptsRepository {
  Future<PromptResponse> makePrompt(String prompt);
}
