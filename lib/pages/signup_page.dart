import 'package:flutter/material.dart';
import '../services/auth_mock_service.dart';
import 'profile_creation_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthMockService();

  @override
  void dispose() {
    _phoneController.dispose();
    _ageController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _authService.sendSms(_phoneController.text);
      final codeController = TextEditingController();
      final result = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Enter SMS Code'),
          content: TextField(
            controller: codeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: '123456'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, codeController.text),
              child: const Text('Verify'),
            ),
          ],
        ),
      );
      if (result != null) {
        final verified = await _authService.verifySms(result);
        if (verified) {
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileCreationPage(),
              ),
            );
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid code')),
            );
          }
        }
      }
    }
  }

  String? _validatePhone(String? value) {
    if (value == null || !value.startsWith('+261') || value.length != 13 || int.tryParse(value.substring(1)) == null) {
      return 'Numéro invalide (+261XXXXXXXXX)';
    }
    return null;
  }

  String? _validateAge(String? value) {
    final age = int.tryParse(value ?? '');
    if (age == null || age < 18) {
      return 'Vous devez avoir au moins 18 ans';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Mot de passe trop court';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Téléphone'),
                keyboardType: TextInputType.phone,
                validator: _validatePhone,
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Âge'),
                keyboardType: TextInputType.number,
                validator: _validateAge,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('S'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
