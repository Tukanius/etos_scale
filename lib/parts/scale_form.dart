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
    sealNumber_0: json["sealNumber_0"] != null ? json["sealNumber_0"] : null,
    sealNumber_1: json["sealNumber_1"] != null ? json["sealNumber_1"] : null,
  );
}

Map<String, dynamic> _$ScaleFormToJson(ScaleForm instance, String? type) {
  Map<String, dynamic> json = {};

  if (type == 'form_builder') {
    json['containerNumber_0_4'] = instance.containerNumber_0_4;
    json['containerNumber_0_7'] = instance.containerNumber_0_7;
    json['containerNumber_1_4'] = instance.containerNumber_1_4;
    json['containerNumber_1_7'] = instance.containerNumber_1_7;
    json['containerNumber_2_4'] = instance.containerNumber_2_4;
    json['containerNumber_2_7'] = instance.containerNumber_2_7;
    json['containerNumber_3_4'] = instance.containerNumber_3_4;
    json['containerNumber_3_7'] = instance.containerNumber_3_7;

    json['sealNumber_0'] = instance.sealNumber_0;
    json['sealNumber_1'] = instance.sealNumber_1;

    json['trailerPlateNumber_0'] = instance.trailerPlateNumber_0;
    json['trailerPlateNumber_1'] = instance.trailerPlateNumber_1;

    return json;
  }

  json['type'] = instance.type;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['weightValue'] = instance.weightValue;

  json['weightType'] = instance.weightType;

  json['trailerPlateNumbers'] = [];
  if (instance.trailerPlateNumber_0 != null &&
      instance.trailerPlateNumber_0 != "") {
    json['trailerPlateNumbers'].add(instance.trailerPlateNumber_0);
  }

  if (instance.trailerPlateNumber_1 != null &&
      instance.trailerPlateNumber_1 != "") {
    json['trailerPlateNumbers'].add(instance.trailerPlateNumber_1);
  }

  json['containerNumbers'] = [];

  if (instance.containerNumber_0_4 != null &&
      instance.containerNumber_0_7 != null &&
      instance.containerNumber_0_4 != "" &&
      instance.containerNumber_0_7 != "") {
    json['containerNumbers']
        .add('${instance.containerNumber_0_4}${instance.containerNumber_0_7}');
  }

  if (instance.containerNumber_1_4 != null &&
      instance.containerNumber_1_7 != null &&
      instance.containerNumber_1_4 != "" &&
      instance.containerNumber_1_7 != "") {
    json['containerNumbers']
        .add('${instance.containerNumber_1_4}${instance.containerNumber_1_7}');
  }

  if (instance.containerNumber_2_4 != null &&
      instance.containerNumber_2_7 != null &&
      instance.containerNumber_2_4 != "" &&
      instance.containerNumber_2_7 != "") {
    json['containerNumbers']
        .add('${instance.containerNumber_2_4}${instance.containerNumber_2_7}');
  }

  if (instance.containerNumber_3_4 != null &&
      instance.containerNumber_3_7 != null &&
      instance.containerNumber_3_4 != "" &&
      instance.containerNumber_3_7 != "") {
    json['containerNumbers']
        .add('${instance.containerNumber_3_4}${instance.containerNumber_3_7}');
  }

  json['sealNumbers'] = [];

  if (instance.sealNumber_0 != null && instance.sealNumber_0 != "") {
    json['sealNumbers'].add(instance.sealNumber_0);
  }

  if (instance.sealNumber_1 != null && instance.sealNumber_1 != "") {
    json['sealNumbers'].add(instance.sealNumber_1);
  }

  return json;
}
