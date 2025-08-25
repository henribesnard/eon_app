import 'package:flutter_test/flutter_test.dart';
import 'package:eon_app/translation_mock_service.dart';

void main() {
  test('preserves cultural terms', () {
    final result = TranslationMockService.translate('Fihavanana sy Vintana', 'mg', 'en');
    expect(result, 'Fihavanana sy Vintana');
  });
}
