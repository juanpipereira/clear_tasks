class PromptResponse {
  final String text;

  const PromptResponse({
    required this.text,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PromptResponse && other.text == text;
  }

  @override
  int get hashCode => text.hashCode;
}
