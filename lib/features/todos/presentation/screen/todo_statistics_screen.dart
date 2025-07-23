import 'package:clear_tasks/core/presentation/widgets/adaptive_scaffold.dart';
import 'package:flutter/material.dart';

class TodoStatisticsScreen extends StatelessWidget {
  const TodoStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveScaffold(
      title: 'Statistics',
      body: Center(
        child: Text('Statistics will be shown here.'),
      ),
    );
  }
}
