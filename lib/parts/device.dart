part of '../models/device.dart';

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    name: json["name"],
    camera1: json['camera1'] != null ? Camera.fromJson(json['camera1']) : null,
    camera2: json['camera2'] != null ? Camera.fromJson(json['camera2']) : null,
    camera3: json['camera3'] != null ? Camera.fromJson(json['camera3']) : null,
    camera4: json['camera4'] != null ? Camera.fromJson(json['camera4']) : null,
    camera5: json['camera5'] != null ? Camera.fromJson(json['camera5']) : null,
    camera6: json['camera6'] != null ? Camera.fromJson(json['camera6']) : null,
    ipAddress: json["ipAddress"],
    connectionStatus: json["connectionStatus"],
    createdAt: json["createdAt"],
  );
}

Map<String, dynamic> _$DeviceToJson(Device instance) {
  Map<String, dynamic> json = {};
  json['name'] = instance.name;
  json['camera1'] = instance.camera1;
  json['camera2'] = instance.camera2;
  json['camera3'] = instance.camera3;
  json['camera4'] = instance.camera4;
  json['camera5'] = instance.camera5;
  json['camera5'] = instance.camera5;
  json['ipAddress'] = instance.ipAddress;
  json['connectionStatus'] = instance.connectionStatus;
  json['createdAt'] = instance.createdAt;

  return json;
}
