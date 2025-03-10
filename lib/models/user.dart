import 'package:etos_scale_windows/models/device.dart';

part '../parts/user.dart';

class User {
  String id;
  String customer;
  String firstname;
  String lastname;
  String? email;
  String? password;
  String? scaleType = "BOTH";
  String? weightType = "BOTH";
  Device? device;

  User({
    required this.id,
    required this.customer,
    required this.firstname,
    required this.lastname,
    this.scaleType,
    this.weightType,
    this.device,
  });

  static toAuthJson(Map<String, dynamic> json) => _$UserToAuthJson(json);
  static fromAuthJson(Map<String, dynamic> json) => _$UserFromAuthJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
