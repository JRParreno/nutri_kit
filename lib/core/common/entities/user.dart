// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String pk;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String profilePk;
  final String? profilePhoto;
  final int age;

  User({
    required this.pk,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profilePk,
    required this.age,
    this.profilePhoto,
  });

  User copyWith({
    String? pk,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePk,
    String? profilePhoto,
    int? age,
  }) {
    return User(
      pk: pk ?? this.pk,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profilePk: profilePk ?? this.profilePk,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      age: age ?? this.age,
    );
  }
}
