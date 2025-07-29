import 'package:clear_tasks/features/prompts/data/data_source/prompts_remote_data_source.dart';
import 'package:clear_tasks/features/prompts/data/dto/prompt_response_dto.dart';
import 'package:clear_tasks/features/prompts/data/repository/prompts_repository_impl.dart';
import 'package:clear_tasks/features/prompts/domain/model/prompt_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPromptsRemoteDataSource extends Mock
    implements PromptsRemoteDataSource {}

void main() {
  late PromptsRepositoryImpl repository;
  late MockPromptsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockPromptsRemoteDataSource();
    repository = PromptsRepositoryImpl(mockRemoteDataSource);
  });

  const tPrompt = 'Test Prompt';
  final tPromptResponseDto = PromptResponseDto(
    text: 'Test Response',
  );
  const tPromptResponse = PromptResponse(
    text: 'Test Response',
  );

  test(
      'should call makePrompt on the remote data source and return a PromptResponse',
      () async {
    // arrange
    when(() => mockRemoteDataSource.makePrompt(tPrompt))
        .thenAnswer((_) async => tPromptResponseDto);
    // act
    final result = await repository.makePrompt(tPrompt);
    // assert
    expect(result, tPromptResponse);
    verify(() => mockRemoteDataSource.makePrompt(tPrompt)).called(1);
    verifyNoMoreInteractions(mockRemoteDataSource);
  });
}
