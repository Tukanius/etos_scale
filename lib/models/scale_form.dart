import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part '../parts/scale_form.dart';

class ScaleForm {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  String? type;
  double? weightValue;
  String? weightType;

  String? vehiclePlateNo;
  TextEditingController vehiclePlateNoController = TextEditingController();

  String? driverName;
  TextEditingController driverNameController = TextEditingController();

  String? driverRegisterNo;
  TextEditingController driverRegisterNoController = TextEditingController();

  String? driverPhone;
  TextEditingController driverPhoneController = TextEditingController();

  String? contractNo;
  TextEditingController contractNoController = TextEditingController();

  String? receiptNo;
  TextEditingController receiptNoController = TextEditingController();

  String? buyerName;
  TextEditingController buyerNameController = TextEditingController();

  String? supplierName;
  TextEditingController supplierNameController = TextEditingController();

  String? containerNumber_0_4;
  TextEditingController containerNumber_0_4Controller = TextEditingController();
  String? containerNumber_0_7;
  TextEditingController containerNumber_0_7Controller = TextEditingController();

  String? containerNumber_1_4;
  TextEditingController containerNumber_1_4Controller = TextEditingController();
  String? containerNumber_1_7;
  TextEditingController containerNumber_1_7Controller = TextEditingController();

  String? containerNumber_2_4;
  TextEditingController containerNumber_2_4Controller = TextEditingController();
  String? containerNumber_2_7;
  TextEditingController containerNumber_2_7Controller = TextEditingController();

  String? containerNumber_3_4;
  TextEditingController containerNumber_3_4Controller = TextEditingController();
  String? containerNumber_3_7;
  TextEditingController containerNumber_3_7Controller = TextEditingController();

  String? trailerPlateNumber_0;
  TextEditingController trailerPlateNumber_0Controller =
      TextEditingController();
  String? trailerPlateNumber_1;
  TextEditingController trailerPlateNumber_1Controller =
      TextEditingController();

  String? sealNumber_0;
  TextEditingController sealNumber_0Controller = TextEditingController();
  String? sealNumber_1;
  TextEditingController sealNumber_1Controller = TextEditingController();

  ScaleForm({
    this.type,
    this.vehiclePlateNo,
    this.weightValue,
    this.containerNumber_0_4,
    this.containerNumber_0_7,
    this.containerNumber_1_4,
    this.containerNumber_1_7,
    this.containerNumber_2_4,
    this.containerNumber_2_7,
    this.containerNumber_3_4,
    this.containerNumber_3_7,
    this.trailerPlateNumber_0,
    this.trailerPlateNumber_1,
    this.sealNumber_0,
    this.sealNumber_1,
    this.weightType,
  });
  static $fromJson(Map<String, dynamic> json) => _$ScaleFormJson(json);

  factory ScaleForm.fromJson(Map<String, dynamic> json) =>
      _$ScaleFormJson(json);
  Map<String, dynamic> toJson({String? type}) => _$ScaleFormToJson(this, type);
}
