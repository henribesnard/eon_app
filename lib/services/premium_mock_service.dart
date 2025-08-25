class PremiumMockService {
  static bool _isPremium = false;

  static bool get isPremium => _isPremium;

  static void upgrade() {
    _isPremium = true;
  }
}
