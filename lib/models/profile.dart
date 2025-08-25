class Profile {

  final String id;
  final String name;
  final String imageUrl;

  Profile({required this.id, required this.name, required this.imageUrl});

  final String userId;
  String bio;
  int age;

  Profile({
    required this.userId,
    this.bio = '',
    this.age = 18,
  });

}
