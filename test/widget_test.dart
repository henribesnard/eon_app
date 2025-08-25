import 'package:flutter_test/flutter_test.dart';
import 'package:eon_app/main.dart';

void main() {
  testWidgets('Discovery page shows first profile', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Alice'), findsOneWidget);
  });
}
