import 'dart:async';

class AuthMockService {
  Future<void> sendSms(String phoneNumber) async {
    // Simulate a network call delay
    await Future.delayed(const Duration(seconds: 1));
    // In a real service you would send an SMS here
  }

  Future<bool> verifySms(String code) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Accept a hardcoded verification code for simulation
    return code == '123456';
  }
}
