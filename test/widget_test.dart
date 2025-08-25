import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eon_app/main.dart';

void main() {
  testWidgets('Profile flow has four steps', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(Stepper), findsOneWidget);
    expect(find.text('Photo'), findsOneWidget);
    expect(find.text('Infos personnelles'), findsOneWidget);
    expect(find.text('Culture'), findsOneWidget);
    expect(find.text('Préférences'), findsOneWidget);
  });
}

