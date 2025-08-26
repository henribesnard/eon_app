import 'package:flutter/material.dart';
import 'translation_mock_service.dart';

class TranslationMessage {
  TranslationMessage({required this.text, required this.lang, this.translated});
  final String text;
  final String lang;
  String? translated;
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.premium = false});
  final bool premium;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<TranslationMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  String _detectLanguage(String text) {
    final lower = text.toLowerCase();
    if (lower.contains('fihavanana') || lower.contains('vintana') || lower.contains('ny') || lower.contains('ao')) {
      return 'mg';
    }
    return 'en';
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final lang = _detectLanguage(text);
    final msg = TranslationMessage(text: text, lang: lang);
    if (widget.premium) {
      msg.translated = TranslationMockService.translate(text, lang, lang == 'en' ? 'mg' : 'en');
    }
    setState(() {
      _messages.add(msg);
    });
    _controller.clear();
  }

  void _translate(TranslationMessage msg) {
    msg.translated = TranslationMockService.translate(msg.text, msg.lang, msg.lang == 'en' ? 'mg' : 'en');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ListTile(
                  title: Text(msg.text),
                  subtitle: msg.translated != null ? Text(msg.translated!) : null,
                  trailing: msg.translated == null && !widget.premium
                      ? TextButton(
                          onPressed: () => _translate(msg),
                          child: const Text('Translate'),
                        )
                      : null,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
