import 'package:etos_scale_windows/models/user.dart';
part '../parts/receipt.dart';

class Receipt {
  String id;
  String contractNo;
  String receiptNo;
  String receiptDate;
  String supplierName;
  String buyerName;
  String productName;
  String routeName;
  String transportName;
  String vehiclePlateNo;
  List<String> trailerPlateNumbers;
  String vehicleWeight;
  String unladedWeight;
  String totalWeight;
  List<String> containerNumbers;
  String driverName;
  String driverPhone;
  String driverRegisterNo;
  String driverPdlNumber;
  String createdAt;
  String updatedAt;
  User? user;

  Receipt(
      {required this.id,
      required this.contractNo,
      required this.receiptNo,
      required this.receiptDate,
      required this.supplierName,
      required this.buyerName,
      required this.productName,
      required this.routeName,
      required this.transportName,
      required this.vehiclePlateNo,
      required this.trailerPlateNumbers,
      required this.vehicleWeight,
      required this.unladedWeight,
      required this.totalWeight,
      required this.containerNumbers,
      required this.driverName,
      required this.driverPhone,
      required this.driverRegisterNo,
      required this.driverPdlNumber,
      this.user,
      required this.createdAt,
      required this.updatedAt});

  static $fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
