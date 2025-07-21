import 'package:clear_tasks/core/constants/gemini_constants.dart';
import 'package:clear_tasks/features/prompts/data/data_source/prompts_remote_data_source.dart';
import 'package:clear_tasks/features/prompts/data/data_source/prompts_remote_data_source_impl.dart';
import 'package:clear_tasks/features/prompts/data/repository/prompts_repository_impl.dart';
import 'package:clear_tasks/features/prompts/domain/model/prompt_response.dart';
import 'package:clear_tasks/features/prompts/domain/repository/prompts_repository.dart';
import 'package:clear_tasks/features/prompts/domain/use_case/make_prompt_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prompts_provider.g.dart';

@Riverpod(keepAlive: true)
GenerativeModel generativeModel(Ref ref) {
  const apiKey = String.fromEnvironment(GeminiConstants.geminiEnvKey);
  if (apiKey.isEmpty) {
    throw Exception('The GEMINI_API_KEY environment variable must be set at compile time');
  }
  return GenerativeModel(model: GeminiConstants.geminiModel, apiKey: apiKey);
}

@Riverpod(keepAlive: true)
PromptsRemoteDataSource promptsRemoteDataSource(Ref ref) {
  return PromptsRemoteDataSourceImpl(ref.watch(generativeModelProvider));
}

@Riverpod(keepAlive: true)
PromptsRepository promptsRepository(Ref ref) {
  return PromptsRepositoryImpl(ref.watch(promptsRemoteDataSourceProvider));
}

@Riverpod(keepAlive: true)
MakePromptUseCase makePromptUseCase(Ref ref) {
  return MakePromptUseCase(ref.watch(promptsRepositoryProvider));
}

@riverpod
class PromptsNotifier extends _$PromptsNotifier {
  @override
  AsyncValue<PromptResponse?> build() {
    return const AsyncData(null);
  }

  Future<void> makePrompt(String prompt) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(makePromptUseCaseProvider).execute(prompt),
    );
  }
}
