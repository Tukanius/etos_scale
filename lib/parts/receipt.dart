part of '../models/receipt.dart';

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
      type: json['type'],
      vehiclePlateNo: json['vehiclePlateNo'],
      weightValue: json['weightValue'],
      driverRegisterNo: json['driverRegisterNo'],
      driverPhone: json['driverPhone'],
      driverName: json['driverName']);
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) {
  Map<String, dynamic> json = {};

  return json;
}
