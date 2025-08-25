import 'package:flutter/material.dart';
import 'services/premium_mock_service.dart';

class PremiumUpsellPage extends StatelessWidget {
  const PremiumUpsellPage({Key? key}) : super(key: key);

  void _upgrade(BuildContext context) {
    PremiumMockService.upgrade();
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Go Premium')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _upgrade(context),
          child: const Text('Upgrade (Mock)'),
        ),
      ),
    );
  }
}
