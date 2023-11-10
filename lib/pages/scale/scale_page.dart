import "package:after_layout/after_layout.dart";
import "package:etos_scale_windows/api/receipt.dart";
import 'package:etos_scale_windows/api/scale_api.dart';
import "package:etos_scale_windows/components/info/scale_card.dart";
import "package:etos_scale_windows/components/scale_item/camera_card.dart";
import 'package:etos_scale_windows/components/scale_item/seal_card.dart';
import "package:etos_scale_windows/models/device.dart";
import "package:etos_scale_windows/models/receipt.dart";
import "package:etos_scale_windows/models/result.dart";
import "package:etos_scale_windows/models/scale.dart";
import 'package:etos_scale_windows/models/scale_form.dart';
import "package:etos_scale_windows/pages/main_page.dart";
import "package:etos_scale_windows/provider/user_provider.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:etos_scale_windows/contants/colors.dart";
import "package:etos_scale_windows/components/info/scale_info.dart";
import "package:etos_scale_windows/components/info/vehicle_info.dart";
import "package:flutter_dropdown_alert/model/data_alert.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:etos_scale_windows/components/scale_item/container_card.dart";
import "package:etos_scale_windows/components/scale_item/trailer_card.dart";
import 'package:etos_scale_windows/components/info/contract_info.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import "package:provider/provider.dart";

class ScalePage extends StatefulWidget {
  static const routeName = "ScalePage";
  final String scaleData;
  const ScalePage({
    Key? key,
    required this.scaleData,
  }) : super(key: key);

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> with AfterLayoutMixin {
  int page = 1;
  int limit = 30;

  bool isLoading = false;
  bool isSearchable = false;
  ScaleForm formData = ScaleForm();

  Result result = Result(count: 0, rows: []);
  Receipt? receipt;
  String type = "IN";
  String weightType = "LADED";
  Device? device;

  loadData(int page, int limit) async {
    Filter filter = Filter();
    Offset offset = Offset(limit: limit, page: page);

    var res =
        await ScaleApi().list(ResultArguments(filter: filter, offset: offset));

    setState(() {
      result = res;
    });
  }

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = false;
    });
    var user = Provider.of<UserProvider>(context, listen: false).user;
    setState(() {
      device = user?.device;
    });
    loadData(page, limit);
    setState(() {
      isLoading = true;
    });
  }

  onSubmit() async {
    final form = formData.fbKey.currentState;

    if (kDebugMode) {
      print(form?.value.toString());
    }

    if (form!.saveAndValidate()) {
      setState(() {
        isLoading = true;
      });

      try {
        formData = ScaleForm.fromJson(form.value);

        setState(() {
          formData.type = type;
          formData.weightType = weightType;
          formData.weightValue = int.parse(widget.scaleData);
        });
        await ScaleApi().truck(formData.toJson());
        await loadData(page, limit);
        showSnackbar();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(MainPage.routeName);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      isLoading = true;
    });
    await loadData(page, limit);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed(MainPage.routeName);
    setState(() {
      isLoading = false;
    });
  }

  showSnackbar() async {
    await AlertController.show(
      "Амжилттай",
      "Баталгаажуулалт амжилттай",
      TypeAlert.success,
    );
  }

  onChangeVehicleNo(String? value) async {
    if (value?.length == 7) {
      setState(() {
        isSearchable = true;
      });
      var res = await ReceiptApi().found(value!);

      if (res != null) {
        setState(() {
          receipt = res;
          if (receipt?.containerNumbers != null) {
            int count = 0;
            receipt?.containerNumbers?.forEach((container) {
              if (count == 0) {
                formData.containerNumber_0_4 = container.substring(0, 4);
                formData.containerNumber_0_7 = container.substring(4, 11);
              } else if (count == 1) {
                formData.containerNumber_1_4 = container.substring(0, 4);
                formData.containerNumber_1_7 = container.substring(4, 11);
              } else if (count == 2) {
                formData.containerNumber_2_4 = container.substring(0, 4);
                formData.containerNumber_3_7 = container.substring(4, 11);
              } else if (count == 3) {
                formData.containerNumber_3_4 = container.substring(0, 4);
                formData.containerNumber_3_7 = container.substring(4, 11);
              }
              count++;
            });
          }

          if (receipt?.trailerPlateNumbers != null) {
            int count = 0;
            receipt?.trailerPlateNumbers?.forEach((trailer) {
              if (count == 0) {
                formData.trailerPlateNumber_0 = trailer;
              } else if (count == 1) {
                formData.trailerPlateNumber_1 = trailer;
              }
              count++;
            });
          }
          if (receipt?.sealNumbers != null) {
            int count = 0;
            receipt?.sealNumbers?.forEach((seal) {
              if (count == 0) {
                formData.sealNumber_0 = seal;
              } else if (count == 1) {
                formData.sealNumber_1 = seal;
              }
              count++;
            });
          }
          formData.contractNo = receipt?.contractNo;
          formData.receiptNo = receipt?.receiptNo;
          formData.buyerName = receipt?.buyerName;
          formData.supplierName = receipt?.supplierName;
          formData.driverName = receipt?.driverName;
          formData.driverRegisterNo = receipt?.driverRegisterNo;
          formData.driverPhone = receipt?.driverPhone;

          formData.fbKey.currentState
              ?.patchValue(formData.toJson(type: 'form_builder'));

          isSearchable = false;
        });
      } else {
        setState(() {
          isSearchable = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formData.fbKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 72,
                  height: MediaQuery.of(context).size.width * 0.14,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      device?.camera1 != null
                          ? CameraCard(
                              index: 0,
                              camera: device?.camera1,
                            )
                          : const SizedBox(),
                      device?.camera2 != null
                          ? CameraCard(
                              index: 1,
                              camera: device?.camera2,
                            )
                          : const SizedBox(),
                      device?.camera3 != null
                          ? CameraCard(
                              index: 2,
                              camera: device?.camera3,
                            )
                          : const SizedBox(),
                      device?.camera4 != null
                          ? CameraCard(
                              index: 3,
                              camera: device?.camera4,
                            )
                          : const SizedBox(),
                      device?.camera5 != null
                          ? CameraCard(
                              index: 4,
                              camera: device?.camera5,
                            )
                          : const SizedBox(),
                      device?.camera6 != null
                          ? CameraCard(
                              index: 5,
                              camera: device?.camera6,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // 9999УБХ 0008УЕМ
                      children: [
                        ContainerCard(
                          index: 0,
                          color: colorBlue,
                          formData: formData,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerCard(
                            index: 1, color: colorRed, formData: formData),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerCard(
                            index: 2, color: colorGreen, formData: formData),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerCard(
                            index: 3, color: colorYellow, formData: formData)
                      ]),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SealCard(
                          index: 0,
                          color: colorBlue,
                          formData: formData,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SealCard(
                          index: 1,
                          color: colorYellow,
                          formData: formData,
                        )
                      ]),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TrailerCard(
                          index: 0,
                          formData: formData,
                        ),
                        const SizedBox(width: 20),
                        TrailerCard(index: 1, formData: formData),
                      ]),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Container(
                    width: 1180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: gray101,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VehicleInfo(
                          onChangeVehicleNo: onChangeVehicleNo,
                          isSearchable: isSearchable,
                          formData: formData,
                        ),
                        const SizedBox(width: 20),
                        ScaleInfo(
                          setType: (value) {
                            setState(() {
                              type = value;
                            });
                          },
                          setWeightType: (value) {
                            setState(() {
                              weightType = value;
                            });
                          },
                          isLoading: isLoading,
                          onSubmit: () {
                            onSubmit();
                          },
                          scaleData: widget.scaleData,
                        ),
                        const SizedBox(width: 20),
                        ContractInfo(formData: formData),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 1180,
                    child: Column(
                      children: [
                        result.count != 0
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Жагсаалт',
                                        style: TextStyle(
                                          color: black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: onRefresh,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: Icon(
                                          Icons.refresh,
                                          color: black,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        Column(
                          children: result.rows!
                              .map((row) => ScaleCard(data: row as Scale))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
