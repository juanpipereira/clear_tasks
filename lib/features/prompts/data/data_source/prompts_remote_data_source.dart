import 'package:clear_tasks/features/prompts/data/dto/prompt_response_dto.dart';

abstract class PromptsRemoteDataSource {
  Future<PromptResponseDto> makePrompt(String prompt);
}