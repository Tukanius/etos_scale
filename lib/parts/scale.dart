part of '../models/scale.dart';

Scale _$ScaleFromJson(Map<String, dynamic> json) {
  return Scale(
    id: json['_id'] as String,
    type: json['type'] as String,
    vehiclePlateNo: json['vehiclePlateNo'] as String,
    weightValue: json['weightValue'],
    trailerPlateNumbers: (json["trailerPlateNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    sealNumbers:
        (json["sealNumbers"] as List).map((item) => item as String).toList(),
    containerNumbers: (json["containerNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    containerCount: json["containerCount"],
    createdAt: json["createdAt"] as String,
    truckScaleStatus: json["truckScaleStatus"],
    truckScaleStatusDate: json["truckScaleStatusDate"],
    weightType: json["weightType"],
  );
}

Map<String, dynamic> _$ScaleToJson(Scale instance) {
  Map<String, dynamic> json = {};
  json['id'] = instance.id;
  json['type'] = instance.type;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['weightValue'] = instance.weightValue;
  json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  json['sealNumbers'] = instance.sealNumbers;
  json['containerNumbers'] = instance.containerNumbers;
  json['containerCount'] = instance.containerCount;
  json['createdAt'] = instance.createdAt;
  json['truckScaleStatus'] = instance.truckScaleStatus;
  json['truckScaleStatusDate'] = instance.truckScaleStatusDate;
  json['weightType'] = instance.weightType;

  return json;
}
