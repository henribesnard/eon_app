import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eon_app/chat_page.dart';

void main() {
  testWidgets('manual translation displayed on request', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChatPage()));
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('salama'), findsNothing);
    await tester.tap(find.text('Translate'));
    await tester.pump();
    expect(find.text('salama'), findsOneWidget);
  });

  testWidgets('premium translates immediately', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChatPage(premium: true)));
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('salama'), findsOneWidget);
  });
}
