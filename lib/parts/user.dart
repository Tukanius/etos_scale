part of '../models/user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] != null ? json['username'] as String : null,
    phone: json['phone'] != null ? json['phone'] as String : null,
    password: json['password'] != null ? json['password'] as String : null,
    userId: json['userId'] != null ? json['userId'] as String : null,
    tokenType: json['tokenType'] != null ? json['tokenType'] as String : null,
    accessToken:
        json['accessToken'] != null ? json['accessToken'] as String : null,
    refreshToken:
        json['refreshToken'] != null ? json['refreshToken'] as String : null,
    sessionState:
        json['sessionState'] != null ? json['sessionState'] as String : null,
    sessionScope:
        json['sessionScope'] != null ? json['sessionScope'] as String : null,
    id: json['id'] != null ? json['id'] as String : null,
    isActive: json['isActive'] != null ? json['isActive'] as String : null,
    role: json['role'] != null ? json['role'] as String : null,
    registerNo:
        json['registerNo'] != null ? json['registerNo'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    firstName: json['firstName'] != null ? json['firstName'] as String : null,
    lastName: json['lastName'] != null ? json['lastName'] as String : null,
    address: json['address'] != null ? json['address'] as String : null,
    userSuspended:
        json['userSuspended'] != null ? json['userSuspended'] as String : null,
    userTerminated: json['userTerminated'] != null
        ? json['userTerminated'] as String
        : null,
    createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
    updatedAt: json['updatedAt'] != null ? json['updatedAt'] as String : null,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  Map<String, dynamic> json = {};
  if (instance.username != null) json['username'] = instance.username;
  if (instance.password != null) json['password'] = instance.password;
  if (instance.phone != null) json['phone'] = instance.phone;
  if (instance.userId != null) json['userId'] = instance.userId;
  if (instance.tokenType != null) json['tokenType'] = instance.tokenType;
  if (instance.accessToken != null) json['accessToken'] = instance.accessToken;
  if (instance.refreshToken != null)
    json['refreshToken'] = instance.refreshToken;
  if (instance.sessionState != null)
    json['sessionState'] = instance.sessionState;
  if (instance.sessionScope != null)
    json['sessionScope'] = instance.sessionScope;
  if (instance.id != null) json['id'] = instance.id;
  if (instance.isActive != null) json['isActive'] = instance.isActive;
  if (instance.role != null) json['role'] = instance.role;
  if (instance.registerNo != null) json['registerNo'] = instance.registerNo;
  if (instance.email != null) json['email'] = instance.email;
  if (instance.firstName != null) json['firstName'] = instance.firstName;
  if (instance.lastName != null) json['lastName'] = instance.lastName;
  if (instance.address != null) json['address'] = instance.address;
  if (instance.userSuspended != null)
    json['userSuspended'] = instance.userSuspended;
  if (instance.userTerminated != null)
    json['userTerminated'] = instance.userTerminated;
  if (instance.createdAt != null) json['createdAt'] = instance.createdAt;
  if (instance.updatedAt != null) json['updatedAt'] = instance.updatedAt;

  return json;
}
