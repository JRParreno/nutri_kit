import 'dart:convert';

import 'package:nutri_kit/core/common/entities/user.dart';

class UserModel extends User {
  
  UserModel({
    required super.pk,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.profilePk,
    required super.gender,
    super.profilePhoto,
  });

  factory UserModel.empty() {
    return UserModel(
      pk: '',
      username: '',
      firstName: '',
      lastName: '',
      email: '',
      profilePk: '',
      gender: '',
    );
  }

  UserModel copyWith({
    String? pk,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? profilePk,
    String? profilePhoto,
    String? gender,
  }) {
    return UserModel(
      pk: pk ?? this.pk,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profilePk: profilePk ?? this.profilePk,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': pk,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profilePk': profilePk,
      'profilePhoto': profilePhoto,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      pk: map['pk'] as String,
      username: map['username'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      profilePk: map['profilePk'] as String,
      profilePhoto: map['profilePhoto'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
