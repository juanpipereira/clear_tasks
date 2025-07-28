import 'package:clear_tasks/core/presentation/widgets/adaptive_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const title = 'Test Title';
  const body = Text('Test Body');
  const androidAction = FloatingActionButton(onPressed: null);
  const iosAction = Icon(CupertinoIcons.add);
  const appBarAction = Icon(Icons.settings);

  Widget buildApp({required TargetPlatform platform}) {
    return MaterialApp(
      theme: ThemeData(platform: platform),
      home: const AdaptiveScaffold(
        title: title,
        body: body,
        androidAction: androidAction,
        iosAction: iosAction,
        appBarAction: appBarAction,
      ),
    );
  }

  group('AdaptiveScaffold', () {
    testWidgets('renders Material Scaffold on Android',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(platform: TargetPlatform.android));

      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(CupertinoPageScaffold), findsNothing);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('renders Cupertino Scaffold on iOS',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(platform: TargetPlatform.iOS));

      expect(find.byType(CupertinoPageScaffold), findsOneWidget);
      expect(find.byType(CupertinoNavigationBar), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsNothing);
      expect(find.byType(FloatingActionButton), findsNothing);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });
  });
}
