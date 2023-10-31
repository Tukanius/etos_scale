import 'package:etos_scale_windows/provider/connection_provider.dart';
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
  var ports = <String>[];
  String scaleData = "000000";
  GlobalKey<FormBuilderState> containerFbKey = GlobalKey<FormBuilderState>();

  @override
  afterFirstLayout(BuildContext context) {
    final scalePort =
        Provider.of<ConnectionProvider>(context, listen: false).scalePort;

    if (scalePort != null) {
      final port = SerialPort(scalePort);

      if (port.openReadWrite()) {
        if (kDebugMode) {
          print('PORT OPENED: $scalePort');
          print(SerialPort.lastError);
        }
      } else {
        if (kDebugMode) {
          print('PORT ClOSED: $scalePort');
        }
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
    }
  }

  onSubmit() async {
    if (containerFbKey.currentState!.saveAndValidate() == false) {
      debugPrint('Helo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: containerFbKey,
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
                    children: [1, 2, 3, 4]
                        .map(
                          (e) => Row(
                            children: [
                              ContainerCard(
                                index: e,
                              ),
                              e == 1 || e == 2 || e == 3
                                  ? const SizedBox(width: 20)
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
