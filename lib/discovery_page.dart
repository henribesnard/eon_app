import 'package:flutter/material.dart';
import 'premium_upsell_page.dart';
import 'services/premium_mock_service.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  static const int freeSwipes = 20;
  static const int freeSuperLikes = 1;

  int remainingSwipes = freeSwipes;
  int remainingSuperLikes = freeSuperLikes;

  void _performSwipe() async {
    if (PremiumMockService.isPremium) return;
    if (remainingSwipes > 0) {
      setState(() => remainingSwipes--);
      if (remainingSwipes == 0) {
        await _showUpsell();
      }
    } else {
      await _showUpsell();
    }
  }

  void _performSuperLike() async {
    if (PremiumMockService.isPremium) return;
    if (remainingSuperLikes > 0) {
      setState(() => remainingSuperLikes--);
      if (remainingSuperLikes == 0) {
        await _showUpsell();
      }
    } else {
      await _showUpsell();
    }
  }

  Future<bool> _showUpsell() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (_) => const PremiumUpsellPage()),
    );
    setState(() {});
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final premium = PremiumMockService.isPremium;
    return Scaffold(
      appBar: AppBar(title: const Text('Discovery')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!premium) Text('Swipes left: $remainingSwipes'),
            if (!premium) Text('Super Likes left: $remainingSuperLikes'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _performSwipe,
              child: Text(premium ? 'Swipe (unlimited)' : 'Swipe'),
            ),
            ElevatedButton(
              onPressed: _performSuperLike,
              child: Text(premium ? 'Super Like (unlimited)' : 'Super Like'),
            ),
            const SizedBox(height: 40),
            ListTile(
              title: const Text('Auto translation'),
              trailing: premium
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.lock),
            ),
            ListTile(
              title: const Text('Advanced filters'),
              trailing: premium
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.lock),
            ),
          ],
        ),
      ),
    );
  }
}
