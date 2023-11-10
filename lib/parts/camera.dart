part of '../models/camera.dart';

Camera _$CameraFromJson(Map<String, dynamic> json) {
  return Camera(
    code: json["code"],
    name: json["name"],
    ip: json["ip"],
    port: json["port"],
    username: json["username"],
    password: json["password"],
  );
}

Map<String, dynamic> _$CameraToJson(Camera instance) {
  Map<String, dynamic> json = {};
  json["code"] = instance.code;
  json["name"] = instance.name;
  json["ip"] = instance.ip;
  json["port"] = instance.port;
  json["username"] = instance.username;
  json["password"] = instance.password;
  return json;
}
