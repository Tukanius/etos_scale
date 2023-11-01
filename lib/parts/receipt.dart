part of '../models/receipt.dart';

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    id: json["_id"] as String,
    contractNo: json["contractNo"] as String,
    receiptNo: json["receiptNo"] as String,
    receiptDate: json["receiptDate"] as String,
    supplierName: json["supplierName"] as String,
    buyerName: json["buyerName"] as String,
    productName: json["productName"] as String,
    routeName: json["routeName"] as String,
    transportName: json["transportName"] as String,
    vehiclePlateNo: json["vehiclePlateNo"] as String,
    trailerPlateNumbers: (json["trailerPlateNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    fullWeight: json["fullWeight"],
    unladedWeight: json["unladedWeight"],
    totalWeight: json["totalWeight"],
    containerNumbers: (json["containerNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    driverName: json["driverName"] as String,
    driverPhone: json["driverPhone"] as String,
    driverRegisterNo: json["driverRegisterNo"] as String,
    driverPdlNumber: json["driverPdlNumber"] as String,
    createdAt: json["createdAt"] as String,
    updatedAt: json["updatedAt"] as String,
    rows: json["rows"] != null
        ? (json["rows"] as List).map((e) => Receipt.fromJson(e)).toList()
        : null,
    count: json["count"],
  );
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) {
  Map<String, dynamic> json = {};

  json['contractNo'] = instance.contractNo;
  json['receiptNo'] = instance.receiptNo;
  json['receiptDate'] = instance.receiptDate;
  json['supplierName'] = instance.supplierName;
  json['buyerName'] = instance.buyerName;
  json['productName'] = instance.productName;
  json['routeName'] = instance.routeName;
  json['transportName'] = instance.transportName;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  json['fullWeight'] = instance.fullWeight;
  json['unladedWeight'] = instance.unladedWeight;
  json['totalWeight'] = instance.totalWeight;
  json['containerNumbers'] = instance.containerNumbers;
  json['driverName'] = instance.driverName;
  json['driverPhone'] = instance.driverPhone;
  json['driverRegisterNo'] = instance.driverRegisterNo;
  json['driverPdlNumber'] = instance.driverPdlNumber;
  json['rows'] = instance.rows;
  json['count'] = instance.rows;
  return json;
}
