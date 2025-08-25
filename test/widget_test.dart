
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


import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:eon_app/main.dart';

void main() {

  testWidgets('Discovery page shows first profile', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Alice'), findsOneWidget);

  testWidgets('Profile flow has four steps', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(Stepper), findsOneWidget);
    expect(find.text('Photo'), findsOneWidget);
    expect(find.text('Infos personnelles'), findsOneWidget);
    expect(find.text('Culture'), findsOneWidget);
    expect(find.text('Préférences'), findsOneWidget);

  });
}

