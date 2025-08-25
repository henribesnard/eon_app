import '../../models/match.dart';

class MatchMockService {
  final List<Match> _matches = [];

  List<Match> matchesForUser(String userId) {
    return _matches
        .where((m) => m.userAId == userId || m.userBId == userId)
        .toList();
  }

  void addMatch(Match match) {
    _matches.add(match);
  }
}
