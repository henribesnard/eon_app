import 'premium_status.dart';

class User {
  final String id;
  final String email;
  final String name;
  final PremiumStatus premiumStatus;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.premiumStatus = PremiumStatus.free,
  });
}
