extension StringSplitToList on String {
  List<String> splitToList() {
    return split(',')
        .map((word) => word.trim())
        .where((label) => label.isNotEmpty)
        .toList();
  }
}
