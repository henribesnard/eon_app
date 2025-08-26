import 'dart:async';

import '../models/message.dart';
import '../models/match.dart';

class ChatMockService {
  static final ChatMockService _instance = ChatMockService._internal();
  factory ChatMockService() => _instance;
  ChatMockService._internal();

  final String _currentUserId = 'user1';

  final Map<String, String> _userNames = {
    'user1': 'Me',
    'user2': 'Alice',
    'user3': 'Bob',
    'user4': 'Charlie',
  };

  final List<Match> _matches = [
    Match(id: '1', userAId: 'user1', userBId: 'user2'),
    Match(id: '2', userAId: 'user1', userBId: 'user3'),
    Match(id: '3', userAId: 'user1', userBId: 'user4'),
  ];

  final Map<String, List<Message>> _messages = {};
  final Map<String, StreamController<List<Message>>> _controllers = {};

  List<Match> getMatches() => _matches;

  String matchName(Match match) {
    final otherId =
        match.userAId == _currentUserId ? match.userBId : match.userAId;
    return _userNames[otherId] ?? otherId;
  }

  Stream<List<Message>> messagesStream(String conversationId) {
    _controllers.putIfAbsent(
        conversationId, () => StreamController<List<Message>>.broadcast());
    _messages.putIfAbsent(conversationId, () => []);
    // Emit current messages
    _controllers[conversationId]!.add(List.from(_messages[conversationId]!));
    return _controllers[conversationId]!.stream;
  }

  void send(String conversationId, Message message) {
    final list = _messages.putIfAbsent(conversationId, () => []);
    list.add(message);
    _controllers[conversationId]?.add(List.from(list));

    // simulate status updates
    Future.delayed(const Duration(milliseconds: 300), () {
      message.status = MessageStatus.sent;
      _controllers[conversationId]?.add(List.from(list));
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      message.status = MessageStatus.delivered;
      _controllers[conversationId]?.add(List.from(list));
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      message.status = MessageStatus.read;
      _controllers[conversationId]?.add(List.from(list));
    });
  }
}
