part of '../models/scale.dart';

Scale _$ScaleFromJson(Map<String, dynamic> json) {
  return Scale(
    id: json['_id'] as String,
    type: json['type'] as String,
    vehiclePlateNo: json['vehiclePlateNo'] as String,
    vehicleMark: json['vehicleMark'] as String,
    vehicleAxleCount: json['vehicleAxleCount'],
    weightValue: json['weightValue'],
    trailerCount: json['trailerCount'],
    containerCount: json['containerCount'],
    trailerPlateNumbers: (json["trailerPlateNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    sealNumbers:
        (json["sealNumbers"] as List).map((item) => item as String).toList(),
    containerNumbers: (json["containerNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    driverName: json['driverName'] as String,
    driverPhone: json['driverPhone'] as String,
    driverPhoneSecond: json['driverPhoneSecond'] != null
        ? json['driverPhoneSecond'] as String
        : null,
    driverRegisterNo: json['driverRegisterNo'] as String,
    driverPdlNumber: json['driverPdlNumber'] != null
        ? json['driverPdlNumber'] as String
        : null,
    truckScaleStatus: json['truckScaleStatus'] != null
        ? json['truckScaleStatus'] as String
        : null,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$ScaleToJson(Scale instance) {
  Map<String, dynamic> json = {};
  json['id'] = instance.id;
  json['type'] = instance.type;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['vehicleMark'] = instance.vehicleMark;
  json['vehicleAxleCount'] = instance.vehicleAxleCount;
  json['weightValue'] = instance.weightValue;
  json['trailerCount'] = instance.trailerCount;
  json['containerCount'] = instance.containerCount;
  json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  json['sealNumbers'] = instance.sealNumbers;
  json['driverName'] = instance.driverName;
  json['driverPhone'] = instance.driverPhone;
  json['driverPhoneSecond'] = instance.driverPhoneSecond;
  json['driverRegisterNo'] = instance.driverRegisterNo;
  json['driverPdlNumber'] = instance.driverPdlNumber;
  json['truckScaleStatus'] = instance.truckScaleStatus;
  json['createdAt'] = instance.createdAt;
  json['containerNumbers'] = instance.containerNumbers;
  return json;
}
