// ignore_for_file: prefer_if_null_operators

part of '../models/scale_form.dart';

ScaleForm _$ScaleFormJson(Map<String, dynamic> json) {
  return ScaleForm(
    type: json["listenController.value"],
    vehiclePlateNo: json["vehiclePlateNo"],
    weightValue: json["weightValue"],
    driverRegisterNo: json["driverRegisterNo"],
    driverPhone: json["driverPhone"],
    driverPhoneSecond:
        json["driverPhoneSecond"] != null ? json["driverPhoneSecond"] : '',
    trailerPlateNumbers_0: json["trailerPlateNumbers_0"] != null
        ? json["trailerPlateNumbers_0"]
        : '',
    trailerPlateNumbers_1: json["trailerPlateNumbers_1"] != null
        ? json["trailerPlateNumbers_1"]
        : '',
    containerNumber_0_4:
        json["containerNumber_0_4"] != null ? json["containerNumber_0_4"] : '',
    containerNumber_0_7:
        json["containerNumber_0_7"] != null ? json["containerNumber_0_7"] : '',
    containerNumber_1_4:
        json["containerNumber_1_4"] != null ? json["containerNumber_1_4"] : '',
    containerNumber_1_7:
        json["containerNumber_1_7"] != null ? json["containerNumber_1_7"] : '',
    containerNumber_2_4:
        json["containerNumber_2_4"] != null ? json["containerNumber_2_4"] : '',
    containerNumber_2_7:
        json["containerNumber_2_7"] != null ? json["containerNumber_2_7"] : '',
    containerNumber_3_4:
        json["containerNumber_3_4"] != null ? json["containerNumber_3_4"] : '',
    containerNumber_3_7:
        json["containerNumber_3_7"] != null ? json["containerNumber_3_7"] : '',
    sealNumbers_0: json["sealNumbers_0"] != null ? json["sealNumbers_0"] : null,
    sealNumbers_1: json["sealNumbers_1"] != null ? json["sealNumbers_1"] : null,
    sealNumbers_2: json["sealNumbers_2"] != null ? json["sealNumbers_2"] : null,
    sealNumbers_3: json["sealNumbers_3"] != null ? json["sealNumbers_3"] : null,
  );
}

Map<String, dynamic> _$ScaleFormToJson(ScaleForm instance) {
  Map<String, dynamic> json = {};
  json['type'] = instance.type;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['weightValue'] = instance.weightValue;
  json['driverRegisterNo'] = instance.driverRegisterNo;
  json['driverPhone'] = instance.driverPhone;
  json['driverPhoneSecond'] = instance.driverPhoneSecond;

  json['trailerPlateNumbers'] = [];

  if (instance.trailerPlateNumbers_0 != null) {
    json['trailerPlateNumbers'].add(instance.trailerPlateNumbers_0);
  }

  if (instance.trailerPlateNumbers_1 != null) {
    json['trailerPlateNumbers'].add(instance.trailerPlateNumbers_1);
  }

  json['containerNumbers'] = [];

  if (instance.containerNumber_0_4 != null &&
      instance.containerNumber_0_7 != null) {
    json['containerNumbers']
        .add('${instance.containerNumber_0_4}${instance.containerNumber_0_7}');
  }

  if (instance.containerNumber_1_4 != null &&
      instance.containerNumber_1_7 != null) {
    json['containerNumbers']
        .add('${instance.containerNumber_1_4}${instance.containerNumber_1_7}');
  }

  if (instance.containerNumber_2_4 != null &&
      instance.containerNumber_2_7 != null) {
    json['containerNumbers']
        .add('${instance.containerNumber_2_4}${instance.containerNumber_2_7}');
  }

  if (instance.containerNumber_3_4 != null &&
      instance.containerNumber_3_7 != null) {
    json['containerNumbers']
        .add('${instance.containerNumber_3_4}${instance.containerNumber_3_7}');
  }

  json['sealNumbers'] = [];

  if (instance.sealNumbers_0 != null) {
    json['sealNumbers'].add(instance.sealNumbers_0);
  }

  if (instance.sealNumbers_1 != null) {
    json['sealNumbers'].add(instance.sealNumbers_1);
  }

  if (instance.sealNumbers_2 != null) {
    json['sealNumbers'].add(instance.sealNumbers_2);
  }

  if (instance.sealNumbers_3 != null) {
    json['sealNumbers'].add(instance.sealNumbers_3);
  }

  return json;
}
