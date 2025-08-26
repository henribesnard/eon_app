import '../models/profile.dart';

class MatchMockService {
  // Profiles that already liked the current user.
  static final Set<String> _likedMe = {'2'}; // Only profile with id '2' liked us.

  static Future<bool> tryMatch(Profile profile) async {
    // Simulate network delay.
    await Future.delayed(const Duration(milliseconds: 300));
    return _likedMe.contains(profile.userId);
  }
}
