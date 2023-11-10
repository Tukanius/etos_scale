part of '../models/user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] as String,
    firstname: (json['firstname'] ?? "") as String,
    lastname: (json['lastname'] ?? "") as String,
    customer: (json['customer'] ?? "") as String,
    scaleType: json['scale'] != null ? json['scale']['type'] as String : "IN",
    weightType:
        json['scale'] != null ? json['scale']['weightType'] as String : "LADED",
    device: json['device'] != null
        ? Device.fromJson(json['device'] as Map<String, dynamic>)
        : null,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  Map<String, dynamic> json = {};

  json['id'] = instance.id;
  json['firstname'] = instance.firstname;
  json['lastname'] = instance.lastname;
  json['customer'] = instance.customer;
  json['device'] = instance.device;
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
