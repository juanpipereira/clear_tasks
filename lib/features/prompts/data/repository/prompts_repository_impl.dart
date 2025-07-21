import 'package:clear_tasks/features/prompts/data/data_source/prompts_remote_data_source.dart';
import 'package:clear_tasks/features/prompts/data/mapper/prompt_response_dto_to_model.dart';
import 'package:clear_tasks/features/prompts/domain/model/prompt_response.dart';
import 'package:clear_tasks/features/prompts/domain/repository/prompts_repository.dart';

class PromptsRepositoryImpl implements PromptsRepository {
  final PromptsRemoteDataSource _remoteDataSource;

  PromptsRepositoryImpl(this._remoteDataSource);

  @override
  Future<PromptResponse> makePrompt(String prompt) async {
    final result = await _remoteDataSource.makePrompt(prompt);
    return result.toModel();
  }
}
