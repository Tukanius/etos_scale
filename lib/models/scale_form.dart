import 'package:etos_scale_windows/components/controller/listen.dart';

part '../parts/scale_form.dart';

class ScaleForm {
  String? type;
  String? vehiclePlateNo;
  double? weightValue;
  String? driverRegisterNo;
  String? driverPhone;
  String? driverPhoneSecond;

  String? containerNumber_0_4;
  String? containerNumber_0_7;

  String? containerNumber_1_4;
  String? containerNumber_1_7;

  String? containerNumber_2_4;
  String? containerNumber_2_7;

  String? containerNumber_3_4;
  String? containerNumber_3_7;

  String? trailerPlateNumbers_0;
  String? trailerPlateNumbers_1;

  String? sealNumbers_0;
  String? sealNumbers_1;
  String? sealNumbers_2;
  String? sealNumbers_3;

  ScaleForm({
    this.type,
    this.vehiclePlateNo,
    this.weightValue,
    this.driverRegisterNo,
    this.driverPhone,
    this.driverPhoneSecond,
    this.containerNumber_0_4,
    this.containerNumber_0_7,
    this.containerNumber_1_4,
    this.containerNumber_1_7,
    this.containerNumber_2_4,
    this.containerNumber_2_7,
    this.containerNumber_3_4,
    this.containerNumber_3_7,
    this.trailerPlateNumbers_0,
    this.trailerPlateNumbers_1,
    this.sealNumbers_0,
    this.sealNumbers_1,
    this.sealNumbers_2,
    this.sealNumbers_3,
  });
  static $fromJson(Map<String, dynamic> json) => _$ScaleFormJson(json);

  factory ScaleForm.fromJson(Map<String, dynamic> json) =>
      _$ScaleFormJson(json);
  Map<String, dynamic> toJson() => _$ScaleFormToJson(this);
}
