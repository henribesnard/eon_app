import 'package:flutter/material.dart';

import '../models/match.dart';
import '../services/chat_mock_service.dart';
import 'chat_page.dart';

class ConversationListPage extends StatelessWidget {
  const ConversationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = ChatMockService();
    final matches = service.getMatches();
    return Scaffold(
      appBar: AppBar(title: const Text('Matches')),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final Match match = matches[index];
          return ListTile(
            title: Text(service.matchName(match)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatPage(match: match)),
              );
            },
          );
        },
      ),
    );
  }
}
