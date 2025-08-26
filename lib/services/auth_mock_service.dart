import '../models/user.dart';

class AuthMockService {
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (phone.isNotEmpty && password.isNotEmpty) {
      return User(
        id: phone,
        email: '$phone@example.com',
        name: 'User $phone',
      );

    if (email.isNotEmpty && password.isNotEmpty) {
      return User(id: '1', email: email, name: 'Mock User');

    }
    return null;
  }
}
