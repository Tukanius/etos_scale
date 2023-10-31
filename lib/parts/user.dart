part of '../models/user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json["_id"] as String,
      email: json["email"] as String,
      username: json["username"] as String);
}

Map<String, dynamic> _$UserToJson(User instance) {
  Map<String, dynamic> json = {};

  json['id'] = instance.id;
  json['email'] = instance.email;
  json['username'] = instance.username;

  return json;
}

String _$UserFromAuthJson(Map<String, dynamic> json) {
  return json['accessToken'];
}

Map<String, dynamic> _$UserToAuthJson(instance) {
  Map<String, dynamic> json = {
    "email": instance["username"],
    "password": instance["password"]
  };

  return json;
}
