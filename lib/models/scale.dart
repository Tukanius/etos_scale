part '../parts/scale.dart';

class Scale {
  String id;
  String type;
  String vehiclePlateNo;
  int weightValue;
  String weightType;
  int containerCount;
  List<String> containerNumbers;
  List<String> trailerPlateNumbers;
  List<String> sealNumbers;
  String truckScaleStatus;
  String truckScaleStatusDate;
  String createdAt;

  Scale({
    required this.id,
    required this.type,
    required this.vehiclePlateNo,
    required this.weightValue,
    required this.containerNumbers,
    required this.trailerPlateNumbers,
    required this.sealNumbers,
    required this.weightType,
    required this.containerCount,
    required this.truckScaleStatus,
    required this.truckScaleStatusDate,
    required this.createdAt,
  });
  static $fromJson(Map<String, dynamic> json) => _$ScaleFromJson(json);

  factory Scale.fromJson(Map<String, dynamic> json) => _$ScaleFromJson(json);
  Map<String, dynamic> toJson() => _$ScaleToJson(this);
}
