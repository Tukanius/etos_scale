part of '../models/receipt.dart';

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return Receipt(
    user: json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null,
    contractNo:
        json['contractNo'] != null ? json['contractNo'] as String : null,
    receiptNo: json['receiptNo'] != null ? json['receiptNo'] as String : null,
    receiptDate:
        json['receiptDate'] != null ? json['receiptDate'] as String : null,
    supplierName:
        json['supplierName'] != null ? json['supplierName'] as String : null,
    buyerName: json['buyerName'] != null ? json['buyerName'] as String : null,
    productName:
        json['productName'] != null ? json['productName'] as String : null,
    routeName: json['routeName'] != null ? json['routeName'] as String : null,
    transportName:
        json['transportName'] != null ? json['transportName'] as String : null,
    vehiclePlateNo: json['vehiclePlateNo'] != null
        ? json['vehiclePlateNo'] as String
        : null,
    trailerPlateNumbers: json['trailerPlateNumbers'] != null
        ? (json['trailerPlateNumbers'] as List)
            .map((e) => Receipt.fromJson(e))
            .toList()
        : null,
    vehicleWeight:
        json['vehicleWeight'] != null ? json['vehicleWeight'] as String : null,
    unladedWeight:
        json['unladedWeight'] != null ? json['unladedWeight'] as String : null,
    totalWeight:
        json['totalWeight'] != null ? json['totalWeight'] as String : null,
    containerNumbers: json['containerNumbers'] != null
        ? (json['containerNumbers'] as List)
            .map((e) => Receipt.fromJson(e))
            .toList()
        : null,
    driverName:
        json['driverName'] != null ? json['driverName'] as String : null,
    driverPhone:
        json['driverPhone'] != null ? json['driverPhone'] as String : null,
    driverRegisterNo: json['driverRegisterNo'] != null
        ? json['driverRegisterNo'] as String
        : null,
    driverPdlNumber: json['driverPdlNumber'] != null
        ? json['driverPdlNumber'] as String
        : null,
    description:
        json['description'] != null ? json['description'] as String : null,
  );
}

Map<String, dynamic> _$ReceiptToJson(Receipt instance) {
  Map<String, dynamic> json = {};
  if (instance.user != null) json['user'] = instance.user;
  if (instance.contractNo != null) json['contractNo'] = instance.contractNo;
  if (instance.receiptNo != null) json['receiptNo'] = instance.receiptNo;
  if (instance.receiptDate != null) json['receiptDate'] = instance.receiptDate;
  if (instance.supplierName != null) {
    json['supplierName'] = instance.supplierName;
  }
  if (instance.buyerName != null) json['buyerName'] = instance.buyerName;
  if (instance.productName != null) json['productName'] = instance.productName;
  if (instance.routeName != null) json['routeName'] = instance.routeName;
  if (instance.transportName != null) {
    json['transportName'] = instance.transportName;
  }
  if (instance.vehiclePlateNo != null) {
    json['vehiclePlateNo'] = instance.vehiclePlateNo;
  }

  if (instance.trailerPlateNumbers != null) {
    json['trailerPlateNumbers'] = instance.trailerPlateNumbers;
  }
  if (instance.vehicleWeight != null) {
    json['vehicleWeight'] = instance.vehicleWeight;
  }
  if (instance.unladedWeight != null) {
    json['unladedWeight'] = instance.unladedWeight;
  }
  if (instance.totalWeight != null) json['totalWeight'] = instance.totalWeight;

  if (instance.containerNumbers != null) {
    json['containerNumbers'] = instance.containerNumbers;
  }
  if (instance.driverName != null) json['driverName'] = instance.driverName;
  if (instance.driverPhone != null) json['driverPhone'] = instance.driverPhone;
  if (instance.driverRegisterNo != null) {
    json['driverRegisterNo'] = instance.driverRegisterNo;
  }
  if (instance.driverPdlNumber != null) {
    json['driverPdlNumber'] = instance.driverPdlNumber;
  }
  if (instance.description != null) json['description'] = instance.description;

  return json;
}
