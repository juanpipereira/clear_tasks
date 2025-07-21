import 'package:clear_tasks/features/prompts/data/dto/prompt_response_dto.dart';
import 'package:clear_tasks/features/prompts/domain/model/prompt_response.dart';

extension PromptResponseDtoToModel on PromptResponseDto {
  PromptResponse toModel() {
    return PromptResponse(text: text);
  }
}