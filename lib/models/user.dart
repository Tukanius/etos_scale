import 'package:flutter/material.dart';

part '../parts/user.dart';

class User {
  String id;
  String email;
  String username;

  User({required this.id, required this.email, required this.username});

  static toAuthJson(Map<String, dynamic> json) => _$UserToAuthJson(json);
  static fromAuthJson(Map<String, dynamic> json) => _$UserFromAuthJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
