import '../models/user.dart';

class AuthMockService {
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (email.isNotEmpty && password.isNotEmpty) {
      return User(id: '1', email: email, name: 'Mock User');
    }
    return null;
  }
}
