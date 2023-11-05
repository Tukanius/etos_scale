part '../parts/receipt.dart';

class Receipt {
  String type;
  String vehiclePlateNo;
  int weightValue;
  List<String>? trailerPlateNumbers;
  List<String>? containerNumbers;
  List<String>? sealNumbers;
  String driverRegisterNo;
  String driverPhone;
  String driverName;
  String? driverPhoneSecond;

  Receipt({
    required this.type,
    required this.vehiclePlateNo,
    required this.weightValue,
    this.trailerPlateNumbers,
    this.containerNumbers,
    this.sealNumbers,
    required this.driverRegisterNo,
    required this.driverPhone,
    required this.driverName,
    this.driverPhoneSecond,
  });

  static $fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
// /**
//  {
//       "_id": "65475a32800c288979a9149a",
//       "type": "OUT",
//       "scale": "6544df8290101b21270e801b",
//       "customer": "654226de3f4d8675de006f1b",
//       "vehicle": "65473162d78185a6a359b159",
//       "vehiclePlateNo": "0008УЕМ",
//       "vehicleMark": "NISSAN",
//       "vehicleAxleCount": 2,
//       "weightValue": 10000,
//       "trailerCount": 1,
//       "containerCount": 1,
//       "trailerPlateNumbers": [
//           "1446ТЧ"
//       ],
//       "sealNumbers": [
//           "1234"
//       ],
//       "trailers": [
//           "65473234d3a86909a8a8c3b2"
//       ],
//       "driverName": "ЭНХБАЯР АМАРТҮВШИН",
//       "driverPhone": "88879595",
//       "driverPhoneSecond": null,
//       "driverRegisterNo": "ЕЮ90011457",
//       "driverPdlNumber": null,
//       "containerNumbers": [
//           "10110144141"
//       ],
//       "containers": [],
//       "truckScaleStatus": "NEW",
//       "createdAt": "2023-11-05T09:02:42.079Z",
//       "updatedAt": "2023-11-05T09:02:42.079Z",
//       "__v": 0
//         },
//  */