class User {
  const User(
      {required this.name,
      required this.username,
      this.image = 'assets/images/user.png'});
  final String name;
  final String username;
  final String image;

  factory User.empty() => User(name: '', username: '');
}
