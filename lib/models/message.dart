
class Message {
  final String id;
  final String fromUserId;
  final String toUserId;
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.content,

enum MessageStatus { sending, sent, delivered, read }

class Message {
  final String id;
  final String text;
  final bool fromMe;
  final DateTime timestamp;
  MessageStatus status;

  Message({
    required this.id,
    required this.text,
    required this.fromMe,
    this.status = MessageStatus.sending,

    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
