part of '../models/scale_receipt.dart';

ScaleReceipt _$ScaleReceiptFromJson(Map<String, dynamic> json) {
  return ScaleReceipt(
    type: json["type"],
    vehiclePlateNo: json["vehiclePlateNo"] as String,
    trailerPlateNumbers: (json["trailerPlateNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    weightValue: json["weightValue"],
    containerNumbers: (json["containerNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    driverRegisterNo: json["driverRegisterNo"] as String,
    driverPhone: json["driverPhone"] as String,
    driverPhoneSecond: json["driverPhoneSecond"],
    rows: json["rows"] != null
        ? (json["rows"] as List).map((e) => ScaleReceipt.fromJson(e)).toList()
        : null,
    count: json["count"],
  );
}

Map<String, dynamic> _$ScaleReceiptToJson(ScaleReceipt instance) {
  Map<String, dynamic> json = {};
  json['type'] = instance.type;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  json['weightValue'] = instance.weightValue;
  json['containerNumbers'] = instance.containerNumbers;
  json['driverRegisterNo'] = instance.driverRegisterNo;
  json['driverPhone'] = instance.driverPhone;
  json['driverPhoneSecond'] = instance.driverPhoneSecond;
  json['rows'] = instance.rows;
  json['count'] = instance.count;

  return json;
}
