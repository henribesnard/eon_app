import 'dart:async';

import '../models/message.dart';
import '../models/match.dart';

class ChatMockService {
  static final ChatMockService _instance = ChatMockService._internal();
  factory ChatMockService() => _instance;
  ChatMockService._internal();

  final List<Match> _matches = [
    Match(id: '1', userAId: '1', userBId: '2'),
    Match(id: '2', userAId: '1', userBId: '3'),
    Match(id: '3', userAId: '1', userBId: '4'),
  ];

  final Map<String, List<Message>> _messages = {};
  final Map<String, StreamController<List<Message>>> _controllers = {};

  List<Match> getMatches() => _matches;

  Stream<List<Message>> messagesStream(String conversationId) {
    _controllers.putIfAbsent(
        conversationId, () => StreamController<List<Message>>.broadcast());
    _messages.putIfAbsent(conversationId, () => []);
    _controllers[conversationId]!
        .add(List<Message>.from(_messages[conversationId]!));
    return _controllers[conversationId]!.stream;
  }

  void send(String conversationId, Message message) {
    final list = _messages.putIfAbsent(conversationId, () => []);
    list.add(message);
    _controllers[conversationId]?.add(List<Message>.from(list));
  }
}
