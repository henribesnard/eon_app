import 'package:flutter/material.dart';
import 'pages/onboarding_page1.dart';

import 'package:provider/provider.dart';

import 'core/service_providers.dart';
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
      title: 'Eon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const OnboardingPage1(),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}
