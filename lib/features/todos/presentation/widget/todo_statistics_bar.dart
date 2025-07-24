import 'package:flutter/material.dart';

class TodoStatisticsBar extends StatelessWidget {
  const TodoStatisticsBar({
    super.key,
    required this.value,
    required this.title,
    this.style,
    this.color,
  });

  final double value;
  final String title;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: style ?? Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          color: color,
          borderRadius: BorderRadius.circular(8),
          minHeight: 24,
          value: value,
        ),
      ],
    );
  }
}
