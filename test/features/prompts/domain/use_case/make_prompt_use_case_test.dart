import 'package:clear_tasks/features/prompts/domain/model/prompt_response.dart';
import 'package:clear_tasks/features/prompts/domain/repository/prompts_repository.dart';
import 'package:clear_tasks/features/prompts/domain/use_case/make_prompt_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPromptsRepository extends Mock implements PromptsRepository {}

void main() {
  late MakePromptUseCase makePromptUseCase;
  late MockPromptsRepository mockPromptsRepository;

  setUp(() {
    mockPromptsRepository = MockPromptsRepository();
    makePromptUseCase = MakePromptUseCase(mockPromptsRepository);
  });

  const tPrompt = 'Test Prompt';
  final tPromptResponse = PromptResponse(
    text: 'Test Response',
  );

  test('should call makePrompt on the repository', () async {
    // arrange
    when(() => mockPromptsRepository.makePrompt(tPrompt)).thenAnswer((_) async => tPromptResponse);
    // act
    final result = await makePromptUseCase.execute(tPrompt);
    // assert
    expect(result, tPromptResponse);
    verify(() => mockPromptsRepository.makePrompt(tPrompt)).called(1);
    verifyNoMoreInteractions(mockPromptsRepository);
  });
}
