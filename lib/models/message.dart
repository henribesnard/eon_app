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
