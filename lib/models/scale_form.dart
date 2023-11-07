import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part '../parts/scale_form.dart';

class ScaleForm {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  String? type;
  String? vehiclePlateNo;
  double? weightValue;
  String? weightType;

  String? containerNumber_0_4;
  String? containerNumber_0_7;

  String? containerNumber_1_4;
  String? containerNumber_1_7;

  String? containerNumber_2_4;
  String? containerNumber_2_7;

  String? containerNumber_3_4;
  String? containerNumber_3_7;

  String? trailerPlateNumber_0;
  String? trailerPlateNumber_1;

  String? sealNumbers_0;
  String? sealNumbers_1;

  ScaleForm({
    this.type,
    this.vehiclePlateNo,
    this.weightValue,
    this.containerNumber_0_4,
    this.containerNumber_0_7,
    this.containerNumber_1_4,
    this.containerNumber_1_7,
    this.containerNumber_2_4,
    this.containerNumber_2_7,
    this.containerNumber_3_4,
    this.containerNumber_3_7,
    this.trailerPlateNumber_0,
    this.trailerPlateNumber_1,
    this.sealNumbers_0,
    this.sealNumbers_1,
    this.weightType,
  });
  static $fromJson(Map<String, dynamic> json) => _$ScaleFormJson(json);

  factory ScaleForm.fromJson(Map<String, dynamic> json) =>
      _$ScaleFormJson(json);
  Map<String, dynamic> toJson({String? type}) => _$ScaleFormToJson(this, type);
}
