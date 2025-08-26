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
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
