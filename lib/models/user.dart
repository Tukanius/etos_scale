part '../parts/user.dart';

class User {
  String? email;
  String? password;
  String? sessionId;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? tokenType;
  String? accessToken;
  String? sessionState;
  String? sessionScope;
  String? registerNo;
  String? lastname;
  String? firstname;
  String? gender;
  String? phone;
  String? address;

  User({
    this.email,
    this.password,
    this.sessionId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.tokenType,
    this.accessToken,
    this.sessionState,
    this.sessionScope,
    this.registerNo,
    this.lastname,
    this.firstname,
    this.gender,
    this.phone,
    this.address,
  });

  static $fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
