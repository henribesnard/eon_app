/// A simple mock service providing administrative data.
///
/// The service collects static reports and basic usage statistics. It is
/// designed to be easily replaced by a real implementation connected to
/// back-end services or analytics providers.
class AdminMockService {
  /// Internal list of textual reports.
  final List<String> _reports = <String>[
    'Daily system health check passed',
    'User signups increased by 20% this week',
    'No critical alerts in the last 24 hours',
  ];

  /// Internal list of usage statistics.
  /// Each entry is a simple map containing a [metric] name and a [value].
  final List<Map<String, Object>> _usageStats = <Map<String, Object>>[
    <String, Object>{'metric': 'activeUsers', 'value': 123},
    <String, Object>{'metric': 'sessions', 'value': 456},
    <String, Object>{'metric': 'errors', 'value': 0},
  ];

  /// Returns a static list of reports.
  ///
  /// Future versions may fetch data from a reporting backend or stream
  /// real-time updates.
  List<String> getReports() => List<String>.unmodifiable(_reports);

  /// Returns a static list of basic usage statistics.
  ///
  /// In a real implementation this could interface with analytics services
  /// or provide observable streams for dashboard widgets.
  List<Map<String, Object>> getUsageStats() =>
      List<Map<String, Object>>.unmodifiable(_usageStats);

  // ---------------------------------------------------------------------------
  // Extension points
  // ---------------------------------------------------------------------------
  // The methods below allow the mock service to be extended or replaced when
  // integrating with a full-featured admin dashboard. They can be removed or
  // expanded upon once real data sources are available.

  /// Adds a new report to the collection.
  void addReport(String report) {
    _reports.add(report);
  }

  /// Adds a new usage statistic entry.
  void addUsageStat(String metric, Object value) {
    _usageStats.add(<String, Object>{'metric': metric, 'value': value});
  }
}
