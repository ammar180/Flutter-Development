class User {
  final String name;
  final String email;
  final String picture;
  final String gender;
  final String phone;
  final String cell;

  User({
    required this.name,
    required this.email,
    required this.picture,
    required this.gender,
    required this.phone,
    required this.cell,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: '${json['name']['title']}. ${json['name']['first']} ${json['name']['last']}',
      email: json['email'],
      picture: json['picture']['large'],
      gender: json['gender'],
      phone: json['phone'],
      cell: json['cell'],
    );
  }
}