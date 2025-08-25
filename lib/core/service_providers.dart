import 'package:provider/provider.dart';

import '../services/mocks/auth_mock_service.dart';
import '../services/mocks/profile_mock_service.dart';
import '../services/mocks/match_mock_service.dart';
import '../services/mocks/chat_mock_service.dart';

List<Provider> appProviders = [
  Provider<AuthMockService>(create: (_) => AuthMockService()),
  Provider<ProfileMockService>(create: (_) => ProfileMockService()),
  Provider<MatchMockService>(create: (_) => MatchMockService()),
  Provider<ChatMockService>(create: (_) => ChatMockService()),
];
