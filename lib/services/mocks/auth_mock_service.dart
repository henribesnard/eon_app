import '../../models/user.dart';

class AuthMockService {
  User? _currentUser;
  final List<User> _users = [
    User(id: '1', email: 'user1@example.com', name: 'User One'),
    User(id: '2', email: 'user2@example.com', name: 'User Two'),
  ];

  User? get currentUser => _currentUser;

  Future<User?> signIn(String email) async {
    try {
      _currentUser = _users.firstWhere((u) => u.email == email);
    } catch (_) {
      _currentUser = null;
    }
    return _currentUser;
  }

  void signOut() {
    _currentUser = null;
  }
}
