class BlockMockService {
  static final Set<String> _blocked = <String>{};

  static void block(String userId) {
    _blocked.add(userId);
    // In a real app, this would remove the user from discovery and conversations lists.
  }

  static bool isBlocked(String userId) => _blocked.contains(userId);
}
