import 'package:clear_tasks/core/domain/model/splitted_list_to_string.dart';
import 'package:clear_tasks/features/todos/domain/model/todo.dart';
import 'package:clear_tasks/features/todos/presentation/widget/todo_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tTodo = Todo(
    id: '1',
    title: 'Test Todo',
    isCompleted: false,
    description: 'Description',
    user: 'User',
    labels: ['Label1', 'Label2'],
  );

  testWidgets('TodoListTile renders correctly and callbacks are called',
      (WidgetTester tester) async {
    bool onToggleCompleteCalled = false;
    bool onDeleteCalled = false;
    bool onTapCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListTile(
            todo: tTodo,
            onDelete: () => onDeleteCalled = true,
            onToggleComplete: (_) => onToggleCompleteCalled = true,
            onTap: () => onTapCalled = true,
          ),
        ),
      ),
    );

    // Verify that the widget renders the todo's data
    expect(find.text(tTodo.title), findsOneWidget);
    expect(find.text(tTodo.description), findsOneWidget);
    expect(find.text(tTodo.user), findsOneWidget);
    expect(find.text(tTodo.labels.joinToString()), findsOneWidget);

    // Verify that the checkbox is not checked
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isFalse);

    // Tap the checkbox and verify that the callback is called
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(onToggleCompleteCalled, isTrue);

    // Tap the delete button and verify that the callback is called
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();
    expect(onDeleteCalled, isTrue);

    // Tap the list tile and verify that the callback is called
    await tester.tap(find.byType(ListTile));
    await tester.pump();
    expect(onTapCalled, isTrue);
  });

  testWidgets('TodoListTile shows line-through when completed',
      (WidgetTester tester) async {
    final tCompletedTodo = tTodo.copyWith(isCompleted: true);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListTile(
            todo: tCompletedTodo,
            onDelete: () {},
            onToggleComplete: (_) {},
          ),
        ),
      ),
    );

    // Verify that the title has a line-through decoration
    final title = tester.widget<Text>(find.text(tCompletedTodo.title));
    expect(title.style?.decoration, TextDecoration.lineThrough);
  });
}
