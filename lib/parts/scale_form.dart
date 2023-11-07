// ignore_for_file: prefer_if_null_operators

part of '../models/scale_form.dart';

ScaleForm _$ScaleFormJson(Map<String, dynamic> json) {
  return ScaleForm(
    type: json["type"] != null ? json["type"] as String : null,
    weightType:
        json["weightType"] != null ? json["weightType"] as String : null,
    vehiclePlateNo: json["vehiclePlateNo"] != null
        ? json["vehiclePlateNo"] as String
        : null,
    weightValue: json["weightValue"] != null ? json["weightValue"] : null,
    trailerPlateNumber_0: json["trailerPlateNumber_0"] != null
        ? json["trailerPlateNumber_0"]
        : null,
    trailerPlateNumber_1: json["trailerPlateNumber_1"] != null
        ? json["trailerPlateNumber_1"]
        : null,
    containerNumber_0_4: json["containerNumber_0_4"] != null
        ? json["containerNumber_0_4"]
        : null,
    containerNumber_0_7: json["containerNumber_0_7"] != null
        ? json["containerNumber_0_7"]
        : null,
    containerNumber_1_4: json["containerNumber_1_4"] != null
        ? json["containerNumber_1_4"]
        : null,
    containerNumber_1_7: json["containerNumber_1_7"] != null
        ? json["containerNumber_1_7"]
        : null,
    containerNumber_2_4: json["containerNumber_2_4"] != null
        ? json["containerNumber_2_4"]
        : null,
    containerNumber_2_7: json["containerNumber_2_7"] != null
        ? json["containerNumber_2_7"]
        : null,
    containerNumber_3_4: json["containerNumber_3_4"] != null
        ? json["containerNumber_3_4"]
        : null,
    containerNumber_3_7: json["containerNumber_3_7"] != null
        ? json["containerNumber_3_7"]
        : null,
    sealNumbers_0: json["sealNumbers_0"] != null ? json["sealNumbers_0"] : null,
    sealNumbers_1: json["sealNumbers_1"] != null ? json["sealNumbers_1"] : null,
  );
}

Map<String, dynamic> _$ScaleFormToJson(ScaleForm instance) {
  Map<String, dynamic> json = {};
  json['type'] = instance.type;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['weightValue'] = instance.weightValue;

  json['weightType'] = instance.weightType;

  json['trailerPlateNumbers'] = [];
  if (instance.trailerPlateNumber_0 != null) {
    json['trailerPlateNumbers'].add(instance.trailerPlateNumber_0);
  }

  if (instance.trailerPlateNumber_1 != null) {
    json['trailerPlateNumbers'].add(instance.trailerPlateNumber_1);
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

  return json;
}
