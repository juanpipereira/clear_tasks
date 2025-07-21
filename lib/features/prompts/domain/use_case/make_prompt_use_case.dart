import 'package:clear_tasks/features/prompts/domain/model/prompt_response.dart';
import 'package:clear_tasks/features/prompts/domain/repository/prompts_repository.dart';

class MakePromptUseCase {
  final PromptsRepository _repository;

  MakePromptUseCase(this._repository);

  Future<PromptResponse> execute(String prompt) async {
    return await _repository.makePrompt(prompt);
  }
}
