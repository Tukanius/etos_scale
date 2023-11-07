import "package:after_layout/after_layout.dart";
import 'package:etos_scale_windows/api/scale_api.dart';
import "package:etos_scale_windows/components/info/scale_list.dart";
import "package:etos_scale_windows/components/scale_item/contianer_seal.dart";
import "package:etos_scale_windows/models/result.dart";
import 'package:etos_scale_windows/models/scale_form.dart';
import "package:etos_scale_windows/pages/main_page.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:etos_scale_windows/contants/colors.dart";
import "package:etos_scale_windows/components/info/scale_info.dart";
import "package:etos_scale_windows/components/info/vehicle_info.dart";
import "package:flutter_dropdown_alert/model/data_alert.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:etos_scale_windows/components/scale_item/container_card.dart";
import "package:etos_scale_windows/components/scale_item/trailer_card.dart";
import "package:etos_scale_windows/components/info/driver_info.dart";
import 'package:flutter_dropdown_alert/alert_controller.dart';

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
  int counter = 0;
  bool isLoading = false;
  ScaleForm sendingData = ScaleForm();
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  Result details = Result(count: 0, rows: []);
  String type = "IN";
  List<String> driverPlate = [];

  loadData(int page, int limit) async {
    Filter filter = Filter();
    Offset offset = Offset(limit: limit, page: page);
    details = await ScaleApi()
        .getScaleList(ResultArguments(filter: filter, offset: offset));
  }

  @override
  afterFirstLayout(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    loadData(page, limit);
    setState(() {
      isLoading = true;
    });
  }

  onSubmit() async {
    final form = fbKey.currentState;

    if (kDebugMode) {
      print(form?.value.toString());
    }

    if (form!.saveAndValidate()) {
      setState(() {
        isLoading = true;
      });

      try {
        sendingData = ScaleForm.fromJson(form.value);
        setState(() {
          sendingData.type = type;
          sendingData.weightValue = double.parse(widget.scaleData);
          sendingData.weightType = "BOTH";
        });
        await ScaleApi().truck(sendingData.toJson());
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(MainPage.routeName);
        showSnackbar();
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

  showSnackbar() {
    Map<String, dynamic> payload = <String, dynamic>{};
    payload["data"] = "content";
    AlertController.show(
        "Амжилттай", "Баталгаажуулалт амжилттай", TypeAlert.success, payload);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: fbKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContainerCard(index: 0, color: colorBlue),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerCard(index: 1, color: colorRed),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerCard(index: 2, color: colorGreen),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerCard(index: 3, color: colorYellow)
                      ]),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ContainerSeal(index: 0, color: colorBlue),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerSeal(index: 1, color: colorYellow)
                      ]),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TrailerCard(index: 0),
                        SizedBox(width: 20),
                        TrailerCard(index: 1),
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
                        const VehicleInfo(),
                        const SizedBox(width: 20),
                        ScaleInfo(
                          isLoading: isLoading,
                          onClick: () {
                            onSubmit();
                          },
                          setType: (value) {
                            setState(() {
                              type = value;
                            });
                          },
                          scaleData: widget.scaleData,
                        ),
                        const SizedBox(width: 20),
                        const DriverInfo(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                details.count! > 0
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Container(
                          width: 1180,
                          height: 1200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ScaleList(
                            data: details,
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
