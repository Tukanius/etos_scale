part of '../models/scale.dart';

Scale _$ScaleFromJson(Map<String, dynamic> json) {
  return Scale(
    id: json['_id'] != null ? json['_id'] as String : null,
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
    receipt: json['receipt'] != null
        ? Receipt.fromJson(json['receipt'] as Map<String, dynamic>)
        : null,
    createdAt: json["createdAt"] as String,
    truckScaleStatus: json["truckScaleStatus"],
    truckScaleStatusDate: json["truckScaleStatusDate"],
    weightType: json["weightType"],
    driverName: json["driverName"] ?? '',
    driverPhone: json["driverPhone"] ?? '',
    driverRegisterNo: json["driverRegisterNo"] ?? '',
  );
}

Map<String, dynamic> _$ScaleToJson(Scale instance) {
  Map<String, dynamic> json = {};
  json['type'] = instance.type;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['weightValue'] = instance.weightValue;
  json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  json['sealNumbers'] = instance.sealNumbers;
  json['containerNumbers'] = instance.containerNumbers;
  json['createdAt'] = instance.createdAt;
  json['truckScaleStatus'] = instance.truckScaleStatus;
  json['truckScaleStatusDate'] = instance.truckScaleStatusDate;
  json['weightType'] = instance.weightType;
  json['driverName'] = instance.driverName;
  json['driverPhone'] = instance.driverPhone;
  json['driverRegisterNo'] = instance.driverRegisterNo;
  return json;
}
