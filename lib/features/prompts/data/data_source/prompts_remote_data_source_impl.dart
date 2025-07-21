import 'package:clear_tasks/features/prompts/data/data_source/prompts_remote_data_source.dart';
import 'package:clear_tasks/features/prompts/data/dto/prompt_response_dto.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class PromptsRemoteDataSourceImpl implements PromptsRemoteDataSource {
  final GenerativeModel _model;

  PromptsRemoteDataSourceImpl(this._model);

  @override
  Future<PromptResponseDto> makePrompt(String prompt) async {
    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    return PromptResponseDto.fromResponse(response.text ?? '');
  }
}
