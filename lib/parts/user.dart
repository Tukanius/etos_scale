part of '../models/user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] != null ? json['id'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    username: json['username'] != null ? json['username'] as String : null,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  Map<String, dynamic> json = {};

  if (instance.id != null) json['id'] = instance.id;
  if (instance.email != null) json['email'] = instance.email;
  if (instance.username != null) json['username'] = instance.username;

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
