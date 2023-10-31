import 'package:etos_scale_windows/models/user.dart';
part '../parts/receipt.dart';

class Receipt {
  User? user;
  String? contractNo;
  String? receiptNo;
  String? receiptDate;
  String? supplierName;
  String? buyerName;
  String? productName;
  String? routeName;
  String? transportName;
  String? vehiclePlateNo;
  List<Receipt>? trailerPlateNumbers;
  String? vehicleWeight;
  String? unladedWeight;
  String? totalWeight;
  List<Receipt>? containerNumbers;
  String? driverName;
  String? driverPhone;
  String? driverRegisterNo;
  String? driverPdlNumber;
  String? description;

  Receipt({
    this.user,
    this.contractNo,
    this.receiptNo,
    this.receiptDate,
    this.supplierName,
    this.buyerName,
    this.productName,
    this.routeName,
    this.transportName,
    this.vehiclePlateNo,
    this.trailerPlateNumbers,
    this.vehicleWeight,
    this.unladedWeight,
    this.totalWeight,
    this.containerNumbers,
    this.driverName,
    this.driverPhone,
    this.driverRegisterNo,
    this.driverPdlNumber,
    this.description,
  });

  static $fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
