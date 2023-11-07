part of '../models/receipt.dart';

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    contractNo: json["contractNo"] as String,
    receiptNo: json["receiptNo"] != null ? json["receiptNo"] as String : null,
    receiptDate: json["receiptDate"] as String,
    supplierName:
        json["supplierName"] != null ? json["supplierName"] as String : null,
    buyerName: json["buyerName"] != null ? json["buyerName"] as String : null,
    productName:
        json["productName"] != null ? json["productName"] as String : null,
    transportName:
        json['transportName'] != null ? json["transportName"] as String : null,
    vehiclePlateNo: json["vehiclePlateNo"] as String,
    fullWeight: json["fullWeight"],
    unladedWeight: json["unladedWeight"],
    totalWeight: json["totalWeight"],
    trailerPlateNumbers: (json["trailerPlateNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    driverName: json["driverName"] as String,
    driverPhone:
        json["driverPhone"] != null ? json["driverPhone"] as String : null,
    driverRegisterNo: json["driverRegisterNo"] as String,
    driverPdlNumber: json["driverPdlNumber"] != null
        ? json["driverPdlNumber"] as String
        : null,
    containerNumbers: (json["containerNumbers"] as List)
        .map((item) => item as String)
        .toList(),
    sealNumbers:
        (json["sealNumbers"] as List).map((item) => item as String).toList(),
    receiptStatus:
        json["receiptStatus"] != null ? json["receiptStatus"] as String : null,
    receiptStatusDate: json["receiptStatusDate"] != null
        ? json["receiptStatusDate"] as String
        : null,
    createdAt: json["createdAt"] as String,
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
  json['transportName'] = instance.transportName;
  json['vehiclePlateNo'] = instance.vehiclePlateNo;
  json['fullWeight'] = instance.fullWeight;
  json['unladedWeight'] = instance.unladedWeight;
  json['totalWeight'] = instance.totalWeight;
  json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  json['driverName'] = instance.driverName;
  json['driverPhone'] = instance.driverPhone;
  json['driverRegisterNo'] = instance.driverRegisterNo;
  json['driverPdlNumber'] = instance.driverPdlNumber;
  json['containerNumbers'] = instance.containerNumbers;
  json['sealNumbers'] = instance.sealNumbers;
  json['receiptStatus'] = instance.receiptStatus;
  json['receiptStatusDate'] = instance.receiptStatusDate;
  json['createdAt'] = instance.createdAt;

  return json;
}
