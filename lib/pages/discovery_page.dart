import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../services/match_mock_service.dart';
import '../services/conversation_mock_service.dart';
import '../widgets/swipe_cards.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final List<Profile> profiles = [
    Profile(userId: '2', bio: 'Alice', age: 25),
    Profile(userId: '3', bio: 'Bob', age: 30),
    Profile(userId: '4', bio: 'Charlie', age: 28),
  ];

  Future<void> _onLike(Profile profile) async {
    final match = await MatchMockService.tryMatch(profile);
    if (match) {
      ConversationMockService.createConversation(profile);
      if (!mounted) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const _MatchDialog(),
      );
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discovery')),
      body: SwipeCards(profiles: profiles, onLike: _onLike),
    );
  }
}

class _MatchDialog extends StatefulWidget {
  const _MatchDialog();

  @override
  State<_MatchDialog> createState() => _MatchDialogState();
}

class _MatchDialogState extends State<_MatchDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      child: const AlertDialog(
        content: Text('Mifankatiava'),
      ),
    );
  }
}
