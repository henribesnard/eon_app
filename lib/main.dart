import 'package:flutter/material.dart';
import 'services/moderation_mock_service.dart';
import 'services/block_mock_service.dart';

import 'chat_page.dart';

import 'profile_flow.dart';

import 'package:provider/provider.dart';

import 'core/service_providers.dart';
import 'ui/home_page.dart';

import 'login_page.dart';


import 'pages/discovery_page.dart';

import 'pages/conversation_list_page.dart';



void main() {
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: MyHomePage(title: 'Chat'),
    );
  }
}

    return MaterialApp(

      title: 'Eon Chat',


      title: 'Eon',

      title: 'Profile Setup',


      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),

  final String title;

      home: const ConversationListPage(),


      home: const DiscoveryPage(),



class _MyHomePageState extends State<MyHomePage> {
  final String _userId = 'user123';
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.add(_controller.text);
      _controller.clear();
    });

      home: const ProfileFlowPage(),
    );

  }
}



      home: const LoginPage(),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),

  Future<void> _handleMenu(String value) async {
    if (value == 'report') {
      final reason = await showDialog<String>(
        context: context,
        builder: (context) {
          final TextEditingController reasonController =
              TextEditingController();
          return AlertDialog(
            title: const Text('Signaler'),
            content: TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: 'Raison',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(reasonController.text),
                child: const Text('Envoyer'),
              ),
            ],
          );
        },
      );
      if (reason != null && reason.isNotEmpty) {
        ModerationMockService.report(_userId, reason);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Utilisateur signalé')),
        );
      }
    } else if (value == 'block') {
      BlockMockService.block(_userId);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final blocked = BlockMockService.isBlocked(_userId);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleMenu,
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'report', child: Text('Signaler')),
              PopupMenuItem(value: 'block', child: Text('Bloquer')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: _messages
                  .map((m) => ListTile(title: Text(m)))
                  .toList(),
            ),
          ),
          if (blocked)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Conversation en lecture seule'),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Votre message',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
        ],
      ),

    );
  }
}

