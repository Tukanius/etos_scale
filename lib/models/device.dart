import 'package:etos_scale_windows/models/camera.dart';

part '../parts/device.dart';

class Device {
  Camera? camera1;
  Camera? camera2;
  Camera? camera3;
  Camera? camera4;
  Camera? camera5;
  Camera? camera6;

  String ipAddress;
  String connectionStatus;
  String createdAt;
  String name;

  Device({
    required this.name,
    this.camera1,
    this.camera2,
    this.camera3,
    this.camera4,
    this.camera5,
    this.camera6,
    required this.ipAddress,
    required this.connectionStatus,
    required this.createdAt,
  });
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
