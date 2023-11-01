import "package:etos_scale_windows/api/trcuk_api.dart";
import "package:etos_scale_windows/provider/user_provider.dart";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "package:after_layout/after_layout.dart";
import "package:etos_scale_windows/contants/colors.dart";
import "package:etos_scale_windows/components/info/scale_info.dart";
import "package:etos_scale_windows/components/info/receipt_info.dart";
import "package:etos_scale_windows/components/info/vehicle_info.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:etos_scale_windows/components/scale_item/camera_card.dart";
import "package:etos_scale_windows/components/scale_item/container_card.dart";
import "package:etos_scale_windows/components/scale_item/trailer_card.dart";
import "package:etos_scale_windows/components/info/driver_info.dart";
import "package:flutter_libserialport/flutter_libserialport.dart";
import "package:provider/provider.dart";

class ScalePage extends StatefulWidget {
  static const routeName = "ScalePage";
  const ScalePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> with AfterLayoutMixin {
  String scaleData = "000000";
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @override
  afterFirstLayout(BuildContext context) async {
    final serialPort = await Provider.of<UserProvider>(context, listen: false)
        .getSelectedSerialPort();

    if (serialPort != null) {
      final port = SerialPort(serialPort);

      if (!port.isOpen && port.openReadWrite()) {
        if (kDebugMode) {
          print("PORT OPENED: $serialPort");
          print(SerialPort.lastError);
        }

        var portConfig = SerialPortConfig()
          ..baudRate = 9600
          ..bits = 8
          ..stopBits = 1;
        port.config = portConfig;

        final reader = SerialPortReader(port);

        var received = "";

        reader.stream.listen((data) {
          var chr = String.fromCharCodes(data);

          received += chr;

          if (received.length == 12) {
            setState(() {
              scaleData = received.substring(2, 8);
            });

            received = "";
          }
        });
      } else {
        if (kDebugMode) {
          print("PORT ClOSED: $serialPort");
        }
      }
    }
  }

  onSubmit() async {
    final form = fbKey.currentState;

    debugPrint(form?.value.toString());

    if (form!.saveAndValidate()) {
      Map<String, dynamic> data = {};

      data["contractNo"] = form.value["contractNo"];
      data["receiptNo"] = form.value["receiptNo"];
      data["receiptDate"] = form.value["receiptDate"];
      data["supplierName"] = form.value["supplierName"];
      data["buyerName"] = form.value["buyerName"];
      data["productName"] = form.value["productName"];
      data["routeName"] = form.value["routeName"];
      data["transportName"] = form.value["transportName"];
      data["vehiclePlateNo"] = form.value["vehiclePlateNo"];
      data["trailerPlateNumbers"] = [
        form.value["trailerPlateNumber_0"],
        form.value["trailerPlateNumber_1"]
      ];
      data["fullWeight"] = double.parse(form.value["fullWeight"]);
      data["unladedWeight"] = double.parse(form.value["unladedWeight"]);
      data["totalWeight"] = double.parse(form.value["totalWeight"]);
      data["containerNumbers"] = [
        form.value["containerNumber_0_4"] + form.value["containerNumber_0_7"],
        form.value["containerNumber_1_4"] + form.value["containerNumber_1_7"],
        form.value["containerNumber_2_4"] + form.value["containerNumber_2_7"],
        form.value["containerNumber_3_4"] + form.value["containerNumber_3_7"],
      ];
      data["driverName"] = form.value["driverName"];
      data["driverPhone"] = form.value["driverPhone"];
      data["driverRegisterNo"] = form.value["driverRegisterNo"];
      data["driverPdlNumber"] = form.value["driverPdlNumber"];

      await TruckApi().scale(data);
    }
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.14,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CameraCard(),
                        SizedBox(
                          width: 20,
                        ),
                        CameraCard(),
                        SizedBox(
                          width: 20,
                        ),
                        CameraCard(),
                        SizedBox(
                          width: 20,
                        ),
                        CameraCard(),
                      ]),
                ),
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
                          onClick: () {
                            onSubmit();
                          },
                          scaleData: scaleData,
                        ),
                        const SizedBox(width: 20),
                        const DriverInfo(),
                      ],
                    ),
                  ),
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
                    child: const ReceiptInfo(),
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
