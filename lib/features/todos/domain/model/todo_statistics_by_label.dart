class TodoStatisticsByLabel {
  final String label;
  final int count;
  final int completedCount;
  double get completedProgress =>
      completedCount > 0 ? completedCount / count : 0;

  const TodoStatisticsByLabel({
    required this.label,
    required this.count,
    required this.completedCount,
  });

  TodoStatisticsByLabel increaseIfCompleted(bool isCompleted) {
    return TodoStatisticsByLabel(
      label: label,
      count: count + 1,
      completedCount: completedCount + (isCompleted ? 1 : 0),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoStatisticsByLabel &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          count == other.count &&
          completedCount == other.completedCount;

  @override
  int get hashCode => label.hashCode ^ count.hashCode ^ completedCount.hashCode;
}
