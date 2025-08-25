class Profile {
  final String userId;
  String bio;
  int age;

  Profile({
    required this.userId,
    this.bio = '',
    this.age = 18,
  });
}
