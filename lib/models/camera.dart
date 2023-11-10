part '../parts/camera.dart';

class Camera {
  String code;
  String name;
  String ip;
  String port;
  String username;
  String password;

  Camera({
    required this.code,
    required this.name,
    required this.ip,
    required this.port,
    required this.username,
    required this.password,
  });
  factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);
  Map<String, dynamic> toJson() => _$CameraToJson(this);
}
