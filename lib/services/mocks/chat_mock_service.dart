import '../../models/message.dart';

class ChatMockService {
  final Map<String, List<Message>> _messages = {};

  List<Message> getMessages(String matchId) => _messages[matchId] ?? [];

  void sendMessage(String matchId, Message message) {
    _messages.putIfAbsent(matchId, () => []).add(message);
  }
}
