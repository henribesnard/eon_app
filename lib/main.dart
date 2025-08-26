import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';
import 'core/service_providers.dart';
import 'login_page.dart';
import 'pages/conversation_list_page.dart';
import 'pages/discovery_page.dart';
import 'profile_flow.dart';
import 'ui/home_page.dart';

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
    return MaterialApp(
      title: 'Eon Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Chat'),
      routes: {
        '/chat': (context) => const ChatPage(),
        '/conversations': (context) => const ConversationListPage(),
        '/discovery': (context) => const DiscoveryPage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfileFlowPage(),
      },
    );
  }
}

