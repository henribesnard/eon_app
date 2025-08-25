import '../models/profile.dart';

class ConversationMockService {
  static final List<Profile> conversations = [];

  static void createConversation(Profile profile) {
    conversations.add(profile);
  }
}
