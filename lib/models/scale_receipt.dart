part '../parts/scale_receipt.dart';

class ScaleReceipt {
  String type;
  String vehiclePlateNo;
  List<String> trailerPlateNumbers;
  int weightValue;
  List<String> containerNumbers;
  String driverRegisterNo;
  String driverPhone;
  String? driverPhoneSecond;
  int? count;
  List<ScaleReceipt>? rows;

  ScaleReceipt({
    required this.type,
    required this.vehiclePlateNo,
    required this.trailerPlateNumbers,
    required this.weightValue,
    required this.containerNumbers,
    required this.driverRegisterNo,
    required this.driverPhone,
    this.driverPhoneSecond,
    this.count,
    this.rows,
  });
  static $fromJson(Map<String, dynamic> json) => _$ScaleReceiptFromJson(json);

  factory ScaleReceipt.fromJson(Map<String, dynamic> json) =>
      _$ScaleReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$ScaleReceiptToJson(this);
}
