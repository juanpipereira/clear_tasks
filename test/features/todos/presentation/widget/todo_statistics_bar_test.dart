import 'package:clear_tasks/features/todos/presentation/widget/todo_statistics_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TodoStatisticsBar renders correctly',
      (WidgetTester tester) async {
    const title = 'Test Statistics';
    const value = 0.75;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TodoStatisticsBar(
            title: title,
            value: value,
          ),
        ),
      ),
    );

    // Verify that the widget renders the title
    expect(find.text(title), findsOneWidget);

    // Verify that the LinearProgressIndicator has the correct value
    final progressIndicator =
        tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator));
    expect(progressIndicator.value, value);
  });
}
