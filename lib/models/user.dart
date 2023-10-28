part '../parts/user.dart';

class User {
  String? username;
  String? phone;
  String? password;
  String? userId;
  String? tokenType;
  String? accessToken;
  String? refreshToken;
  String? sessionState;
  String? sessionScope;
  String? id;
  String? isActive;
  String? role;
  String? registerNo;
  String? email;
  String? firstName;
  String? lastName;
  String? address;
  String? userSuspended;
  String? userTerminated;
  String? createdAt;
  String? updatedAt;

  User({
    this.username,
    this.password,
    this.userId,
    this.tokenType,
    this.accessToken,
    this.refreshToken,
    this.sessionState,
    this.sessionScope,
    this.phone,
    this.id,
    this.isActive,
    this.role,
    this.registerNo,
    this.email,
    this.firstName,
    this.lastName,
    this.address,
    this.userSuspended,
    this.userTerminated,
    this.createdAt,
    this.updatedAt,
  });

  static $fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
