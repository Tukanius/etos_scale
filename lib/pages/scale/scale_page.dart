import 'package:etos_scale_windows/api/trcuk_api.dart';
import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:after_layout/after_layout.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/components/info/scale_info.dart';
import 'package:etos_scale_windows/components/info/receipt_info.dart';
import 'package:etos_scale_windows/components/info/vehicle_info.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:etos_scale_windows/components/scale_item/camera_card.dart';
import 'package:etos_scale_windows/components/scale_item/container_card.dart';
import 'package:etos_scale_windows/components/scale_item/trailer_card.dart';
import 'package:etos_scale_windows/components/info/driver_info.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:provider/provider.dart';

class ScalePage extends StatefulWidget {
  static const routeName = 'ScalePage';
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
          print('PORT OPENED: $serialPort');
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
          print('PORT ClOSED: $serialPort');
        }
      }
    }
  }

  onSubmit() async {
    final form = fbKey.currentState;

    debugPrint(form?.value.toString());

    if (form!.saveAndValidate()) {
      await TruckApi().scale(Receipt.fromJson(form.value));
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2]
                        .map(
                          (e) => Row(
                            children: [
                              TrailerCard(index: e),
                              e == 1
                                  ? const SizedBox(
                                      width: 20,
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        )
                        .toList(),
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
