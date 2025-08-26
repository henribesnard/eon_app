import 'package:flutter/material.dart';

import '../models/message.dart';
import '../models/match.dart';
import '../services/chat_mock_service.dart';

class ChatPage extends StatefulWidget {
  final Match match;
  const ChatPage({super.key, required this.match});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatMockService _service = ChatMockService();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User ${widget.match.userBId}')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: _service.messagesStream(widget.match.id),
              builder: (context, snapshot) {
                final messages = snapshot.data ?? [];
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => _scrollToBottom());
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return _buildMessage(msg);
                  },
                );
              },
            ),
          ),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message msg) {
    final isFromMe = msg.fromUserId == widget.match.userAId;
    final alignment =
        isFromMe ? Alignment.centerRight : Alignment.centerLeft;
    final color = isFromMe ? Colors.blue[200] : Colors.grey[300];
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(msg.content),
      ),
    );
  }

  Widget _buildInput() {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Message',
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _handleSend,
          ),
        ],
      ),
    );
  }

  void _handleSend() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fromUserId: widget.match.userAId,
      toUserId: widget.match.userBId,
      content: text,
    );
    _service.send(widget.match.id, message);
    _textController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
