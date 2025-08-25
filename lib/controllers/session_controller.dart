import '../models/user.dart';

class SessionController {
  static final SessionController _instance = SessionController._internal();
  factory SessionController() => _instance;
  SessionController._internal();

  User? currentUser;
}
