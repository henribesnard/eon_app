class ModerationMockService {
  static final List<_Report> _reports = [];

  static void report(String userId, String reason) {
    _reports.add(_Report(userId, reason));
  }

  static List<_Report> get reports => List.unmodifiable(_reports);
}

class _Report {
  final String userId;
  final String reason;

  _Report(this.userId, this.reason);
}
