import 'package:etos_scale_windows/components/info/receipt_info.dart';
import 'package:etos_scale_windows/components/info/scale_info.dart';
import 'package:etos_scale_windows/components/info/vehicle_info.dart';
import 'package:etos_scale_windows/components/scale_item/camera_card.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/components/scale_item/container_card.dart';
import 'package:etos_scale_windows/components/info/driver_info.dart';
import 'package:etos_scale_windows/components/scale_item/trailer_card.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @override
  afterFirstLayout(BuildContext context) {
    // final name = SerialPort.availablePorts.first;
    // final port = SerialPort(name);
    // if (!port.openReadWrite()) {
    //   if (kDebugMode) {
    //     print(SerialPort.lastError);
    //   }
    // }

    // var portConfig = SerialPortConfig()
    //   ..baudRate = 9600
    //   ..bits = 8
    //   ..stopBits = 1;
    // port.config = portConfig;

    // final reader = SerialPortReader(port);

    // var received = "";

    // reader.stream.listen((data) {
    //   var chr = String.fromCharCodes(data);

    //   received += chr;

    //   if (received.length == 12) {
    //     setState(() {
    //       scaleData = received.substring(2, 8);
    //     });

    //     received = "";
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.14,
          child: ListView(scrollDirection: Axis.horizontal, children: const [
            CameraCard(),
            CameraCard(),
            CameraCard(),
            CameraCard(),
          ]),
        ),
        const SizedBox(height: 20),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerCard(),
                SizedBox(width: 20),
                ContainerCard(),
                SizedBox(width: 20),
                ContainerCard(),
                SizedBox(width: 20),
                ContainerCard(),
              ],
            )),
        const SizedBox(height: 20),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TrailerCard(),
                SizedBox(width: 20),
                TrailerCard(),
              ],
            )),
        const SizedBox(height: 20),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Container(
                width: 1180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorBaseBg2,
                ),
                padding: const EdgeInsets.all(20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VehicleInfo(),
                    SizedBox(width: 20),
                    ScaleInfo(),
                    SizedBox(width: 20),
                    DriverInfo()
                  ],
                ))),
        const SizedBox(height: 20),
        Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Container(
                width: 1180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorBaseBg2,
                ),
                padding: const EdgeInsets.all(20),
                child: const ReceiptInfo())),
        const SizedBox(height: 20),
      ],
    ));
  }
}
