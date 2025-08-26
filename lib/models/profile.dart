class Profile {
  final String id;
  final String name;
  final String imageUrl;
  final String userId;
  String bio;
  int age;

  Profile({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.userId,
    this.bio = '',
    this.age = 18,
  });
}

