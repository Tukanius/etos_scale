import 'package:etos_scale_windows/components/controller/listen.dart';

part '../parts/truck_scale_form.dart';

class TruckScaleForm {
  String type;
  String vehiclePlateNo;
  int weightValue;
  String driverRegisterNo;
  String driverPhone;
  String driverPhoneSecond;
  String containerNumber_0_4;
  String containerNumber_0_7;

  String containerNumber_1_4;
  String containerNumber_1_7;

  String containerNumber_2_4;
  String containerNumber_2_7;

  String containerNumber_3_4;
  String containerNumber_3_7;

  String trailerPlateNumbers_0;
  String trailerPlateNumbers_1;
  String sealNumbers_0;
  String sealNumbers_1;
  String sealNumbers_2;
  String sealNumbers_3;

  TruckScaleForm({
    required this.type,
    required this.vehiclePlateNo,
    required this.weightValue,
    required this.driverRegisterNo,
    required this.driverPhone,
    required this.driverPhoneSecond,
    required this.containerNumber_0_4,
    required this.containerNumber_0_7,
    required this.containerNumber_1_4,
    required this.containerNumber_1_7,
    required this.containerNumber_2_4,
    required this.containerNumber_2_7,
    required this.containerNumber_3_4,
    required this.containerNumber_3_7,
    required this.trailerPlateNumbers_0,
    required this.trailerPlateNumbers_1,
    required this.sealNumbers_0,
    required this.sealNumbers_1,
    required this.sealNumbers_2,
    required this.sealNumbers_3,
  });
  static $fromJson(Map<String, dynamic> json) => _$TruckScaleFormFromJson(json);

  factory TruckScaleForm.fromJson(Map<String, dynamic> json) =>
      _$TruckScaleFormFromJson(json);
  Map<String, dynamic> toJson() => _$TruckScaleFormToJson(this);
}
