import '../models/user.dart';

class AuthMockService {
  Future<User?> login(String phone, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (phone.isNotEmpty && password.isNotEmpty) {
      return User(
        id: phone,
        email: '$phone@example.com',
        name: 'User $phone',
      );
    }
    return null;
  }
}
