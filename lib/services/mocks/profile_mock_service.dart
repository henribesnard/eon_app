import '../../models/profile.dart';

class ProfileMockService {
  final Map<String, Profile> _profiles = {};

  Profile? getProfile(String userId) => _profiles[userId];

  void setProfile(Profile profile) {
    _profiles[profile.userId] = profile;
  }
}
