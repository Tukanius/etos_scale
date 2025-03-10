part '../parts/receipt.dart';

class Receipt {
  String contractNo;
  String? receiptNo;
  String receiptDate;
  String? supplierName;
  String? buyerName;
  String? productName;
  String? transportName;
  String vehiclePlateNo;
  int? fullWeight;
  int unladedWeight;
  int totalWeight;
  List<String>? trailerPlateNumbers;
  String driverName;
  String? driverPhone;
  String driverRegisterNo;
  String? driverPdlNumber;
  List<String>? containerNumbers;
  List<String>? sealNumbers;
  String? receiptStatus;
  String? receiptStatusDate;
  String createdAt;

  Receipt({
    required this.contractNo,
    this.receiptNo,
    required this.receiptDate,
    this.supplierName,
    this.buyerName,
    this.productName,
    this.transportName,
    required this.vehiclePlateNo,
    this.fullWeight,
    required this.unladedWeight,
    required this.totalWeight,
    this.trailerPlateNumbers,
    required this.driverName,
    this.driverPhone,
    required this.driverRegisterNo,
    this.driverPdlNumber,
    this.containerNumbers,
    this.sealNumbers,
    this.receiptStatus,
    this.receiptStatusDate,
    required this.createdAt,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
