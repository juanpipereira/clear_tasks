import 'package:flutter/material.dart';

class TodoStatisticsBar extends StatelessWidget {
  const TodoStatisticsBar({
    super.key,
    required this.value,
    required this.title,
  });

  final double value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(8),
          minHeight: 24,
          value: value,
        ),
      ],
    );
  }
}
