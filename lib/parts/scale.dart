part of '../models/scale.dart';

Scale _$ScaleFromJson(Map<String, dynamic> json) {
  return Scale(
      id: json['_id'],
      type: json['type'],
      vehiclePlateNo: json['vehiclePlateNo'],
      vehicleMark: json['vehicleMark'],
      vehicleAxleCount: json['vehicleAxleCount'],
      weightValue: json['weightValue'],
      trailerCount: json['trailerCount'],
      containerCount: json['containerCount'],
      trailerPlateNumbers: json['trailerPlateNumbers'],
      sealNumbers: json['sealNumbers'],
      driverName: json['driverName'],
      driverPhone: json['driverPhone'],
      driverPhoneSecond: json['driverPhoneSecond'],
      driverRegisterNo: json['driverRegisterNo'],
      driverPdlNumber: json['driverPdlNumber'],
      truckScaleStatus: json['truckScaleStatus'],
      createdAt: json['createdAt']);
}

Map<String, dynamic> _$ScaleToJson(Scale instance) {
  Map<String, dynamic> json = {};

  return json;
}
