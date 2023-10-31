part of '../models/user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    email: json['email'] != null ? json['email'] as String : null,
    password: json['password'] != null ? json['password'] as String : null,
    sessionId: json['sessionId'] != null ? json['sessionId'] as String : null,
    id: json['id'] != null ? json['id'] as String : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
    tokenType: json['tokenType'] != null ? json['tokenType'] as String : null,
    accessToken:
        json['accessToken'] != null ? json['accessToken'] as String : null,
    sessionState:
        json['sessionState'] != null ? json['sessionState'] as String : null,
    sessionScope:
        json['sessionScope'] != null ? json['sessionScope'] as String : null,
    registerNo:
        json['registerNo'] != null ? json['registerNo'] as String : null,
    lastname: json['lastname'] != null ? json['lastname'] as String : null,
    firstname: json['firstname'] != null ? json['firstname'] as String : null,
    gender: json['gender'] != null ? json['gender'] as String : null,
    phone: json['phone'] != null ? json['phone'] as String : null,
    address: json['address'] != null ? json['address'] as String : null,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  Map<String, dynamic> json = {};
  if (instance.email != null) json['email'] = instance.email;
  if (instance.password != null) json['password'] = instance.password;
  if (instance.sessionId != null) json['sessionId'] = instance.sessionId;

  if (instance.id != null) json['id'] = instance.id;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;
  if (instance.tokenType != null) json['tokenType'] = instance.tokenType;
  if (instance.accessToken != null) json['accessToken'] = instance.accessToken;
  if (instance.sessionState != null) {
    json['sessionState'] = instance.sessionState;
  }
  if (instance.sessionScope != null) {
    json['sessionScope'] = instance.sessionScope;
  }
  if (instance.registerNo != null) json['registerNo'] = instance.registerNo;
  if (instance.lastname != null) json['lastname'] = instance.lastname;
  if (instance.firstname != null) json['firstname'] = instance.firstname;
  if (instance.gender != null) json['gender'] = instance.gender;
  if (instance.phone != null) json['phone'] = instance.phone;
  if (instance.address != null) json['address'] = instance.address;

  return json;
}
