part '../parts/scale.dart';

class Scale {
  String id;
  String type;
  String vehiclePlateNo;
  String vehicleMark;
  String vehicleAxleCount;
  String weightValue;
  String trailerCount;
  String containerCount;
  String trailerPlateNumbers;
  String sealNumbers;
  String driverName;
  String driverPhone;
  String driverPhoneSecond;
  String driverRegisterNo;
  String driverPdlNumber;
  String truckScaleStatus;
  String createdAt;

  Scale({
    required this.id,
    required this.type,
    required this.vehiclePlateNo,
    required this.vehicleMark,
    required this.vehicleAxleCount,
    required this.weightValue,
    required this.trailerCount,
    required this.containerCount,
    required this.trailerPlateNumbers,
    required this.sealNumbers,
    required this.driverName,
    required this.driverPhone,
    required this.driverPhoneSecond,
    required this.driverRegisterNo,
    required this.driverPdlNumber,
    required this.truckScaleStatus,
    required this.createdAt,
  });
  static $fromJson(Map<String, dynamic> json) => _$ScaleFromJson(json);

  factory Scale.fromJson(Map<String, dynamic> json) => _$ScaleFromJson(json);
  Map<String, dynamic> toJson() => _$ScaleToJson(this);
}
