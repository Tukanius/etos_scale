import 'package:etos_scale_windows/models/receipt.dart';
part '../parts/scale.dart';

class Scale {
  String? id;
  String vehiclePlateNo;
  String weightType;
  String type;
  int weightValue;
  Receipt? receipt;
  List<String> containerNumbers;
  List<String> trailerPlateNumbers;
  List<String> sealNumbers;
  String truckScaleStatus;
  String truckScaleStatusDate;
  String createdAt;
  String driverName;
  String driverRegisterNo;
  String driverPhone;

  Scale({
    this.id,
    required this.type,
    required this.vehiclePlateNo,
    required this.weightValue,
    required this.containerNumbers,
    required this.trailerPlateNumbers,
    required this.sealNumbers,
    required this.weightType,
    required this.truckScaleStatus,
    required this.truckScaleStatusDate,
    this.receipt,
    required this.createdAt,
    required this.driverName,
    required this.driverRegisterNo,
    required this.driverPhone,
  });

  factory Scale.fromJson(Map<String, dynamic> json) => _$ScaleFromJson(json);
  Map<String, dynamic> toJson() => _$ScaleToJson(this);
}
