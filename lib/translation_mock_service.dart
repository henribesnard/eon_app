import 'dart:core';

class TranslationMockService {
  static const _culturalTerms = {
    'fihavanana',
    'vintana',
  };

  static final Map<String, String> _enToMg = {
    'hello': 'salama',
    'world': 'tany',
  };

  static final Map<String, String> _mgToEn = {
    'salama': 'hello',
    'tany': 'world',
  };

  static String translate(String text, String from, String to) {
    final lower = text.split(' ');
    final buffer = <String>[];
    for (final word in lower) {
      final key = word.toLowerCase();
      if (_culturalTerms.contains(key)) {
        buffer.add(word);
        continue;
      }
      if (from == 'en' && to == 'mg') {
        buffer.add(_enToMg[key] ?? word);
      } else if (from == 'mg' && to == 'en') {
        buffer.add(_mgToEn[key] ?? word);
      } else {
        buffer.add(word);
      }
    }
    return buffer.join(' ');
  }
}
