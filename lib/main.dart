import 'package:flutter/material.dart';
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
    return MaterialApp(

      title: 'Eon Chat',


      title: 'Eon',

      title: 'Profile Setup',


      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),


      home: const ConversationListPage(),


      home: const DiscoveryPage(),


      home: const ProfileFlowPage(),
    );
  }
}



      home: const LoginPage(),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

