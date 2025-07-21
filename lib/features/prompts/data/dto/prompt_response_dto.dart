class PromptResponseDto {
  final String text;

  PromptResponseDto({
    required this.text,
  });

  factory PromptResponseDto.fromResponse(String responseText) {
    return PromptResponseDto(text: responseText);
  }
}
