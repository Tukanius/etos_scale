import "dart:async";

import 'package:etos_scale_windows/api/truck_api.dart';
import "package:etos_scale_windows/components/controller/listen.dart";
import "package:etos_scale_windows/components/scale_item/contianer_seal.dart";
import "package:etos_scale_windows/models/result.dart";
import "package:etos_scale_windows/provider/user_provider.dart";
import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "package:after_layout/after_layout.dart";
import "package:etos_scale_windows/contants/colors.dart";
import "package:etos_scale_windows/components/info/scale_info.dart";
import "package:etos_scale_windows/components/info/receipt_info.dart";
import "package:etos_scale_windows/components/info/vehicle_info.dart";
import "package:flutter/services.dart";
import "package:flutter_dropdown_alert/model/data_alert.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:etos_scale_windows/components/scale_item/container_card.dart";
import "package:etos_scale_windows/components/scale_item/trailer_card.dart";
import "package:etos_scale_windows/components/info/driver_info.dart";
import "package:flutter_libserialport/flutter_libserialport.dart";
import "package:provider/provider.dart";
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:platform_device_id/platform_device_id.dart';

class ScalePage extends StatefulWidget {
  static const routeName = "ScalePage";
  const ScalePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> with AfterLayoutMixin {
  int page = 1;
  int limit = 30;
  int counter = 0;
  String? _deviceId;
  String scaleData = "000000";
  bool isLoading = false;
  late IO.Socket socket;
  ScaleInfoDetail tableRow = ScaleInfoDetail(
    result: Result(rows: [], count: 0),
  );
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  ListenController listenController = ListenController();

  loadData(int page, int limit) async {
    Filter filter = Filter();
    Offset offset = Offset(limit: limit, page: page);
    Result res = await TruckApi()
        .scaleReceiptList(ResultArguments(filter: filter, offset: offset));
    setState(() => tableRow = ScaleInfoDetail(result: res));
  }

  _connectSocket() {
    socket.onConnect((data) => debugPrint('Socket Connection'));
    socket.onDisconnect((data) => debugPrint('Disconnect'));
    socket.onConnectError((data) => debugPrint('Socket Connection Error'));
    socket.on('data', (data) {
      debugPrint('Received data from server: $data');
    });
    socket.onReconnect((data) {
      debugPrint('Reconnected to the socket server');
    });
    socket.onReconnecting((data) {
      debugPrint('Reconnecting to the socket server');
    });
  }

  Future<void> initPlatformState() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
      if (kDebugMode) {
        print("deviceId->$_deviceId");
      }
    });
  }

  @override
  afterFirstLayout(BuildContext context) async {
    await initPlatformState();
    socket = IO.io(
      'http://192.168.1.8:30605',
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
        {
          'machineId': _deviceId,
          'machineType': 'SCALE',
        },
      ).build(),
    );
    _connectSocket();
    socket.emit('weightValue', scaleData);
    if (kDebugMode) {
      print('=====weightValue======');
      print(scaleData);
      print('=====weightValue======');
    }
    loadData(page, limit);
    // ignore: use_build_context_synchronously
    final serialPort = await Provider.of<UserProvider>(context, listen: false)
        .getSelectedSerialPort();
    if (serialPort != null) {
      final port = SerialPort(serialPort);

      if (!port.isOpen && port.openReadWrite()) {
        if (kDebugMode) {
          debugPrint("PORT OPENED: $serialPort");
          debugPrint(SerialPort.lastError as String?);
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
          debugPrint("PORT ClOSED: $serialPort");
        }
      }
    }
    AlertController.onTabListener(
      (Map<String, dynamic>? payload, TypeAlert type) {},
    );
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
        Map<String, dynamic> data = {};

        data["type"] = listenController.value;
        data["vehiclePlateNo"] = form.value["vehiclePlateNo"];
        data["weightValue"] = scaleData;

        List<String> trailerPlateNumbers = [];
        if (form.value["trailerPlateNumber_0"] != null) {
          trailerPlateNumbers.add(form.value["trailerPlateNumber_0"]);
        }
        if (form.value["trailerPlateNumber_1"] != null) {
          trailerPlateNumbers.add(form.value["trailerPlateNumber_1"]);
        }
        data["trailerPlateNumbers"] = trailerPlateNumbers;

        List<String> containerNumbers = [];

        if (form.value["containerNumber_0_4"] != null &&
            form.value["containerNumber_0_7"] != null) {
          containerNumbers.add(
            form.value["containerNumber_0_4"] +
                form.value["containerNumber_0_7"],
          );
        }
        if (form.value["containerNumber_1_4"] != null &&
            form.value["containerNumber_1_7"] != null) {
          containerNumbers.add(form.value["containerNumber_1_4"] +
              form.value["containerNumber_1_7"]);
        }
        if (form.value["containerNumber_2_4"] != null &&
            form.value["containerNumber_2_7"] != null) {
          containerNumbers.add(form.value["containerNumber_2_4"] +
              form.value["containerNumber_2_7"]);
        }
        if (form.value["containerNumber_3_4"] != null &&
            form.value["containerNumber_3_7"] != null) {
          containerNumbers.add(form.value["containerNumber_3_4"] +
              form.value["containerNumber_3_7"]);
        }

        data["containerNumbers"] = containerNumbers;

        data["driverRegisterNo"] = form.value["driverRegisterNo"];
        data["driverPhone"] = form.value["driverPhone"];
        data["driverPhoneSecond"] = form.value["driverPhoneSecond"];

        await TruckApi().scaleReceipt(data);
        showSnackbar();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(ScalePage.routeName);
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
                        ContainerSeal(index: 1, color: colorRed),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerSeal(index: 2, color: colorGreen),
                        const SizedBox(
                          width: 20,
                        ),
                        ContainerSeal(index: 3, color: colorYellow)
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
                          scaleData: scaleData,
                          listenController: listenController,
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
                    height: 1200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: gray101,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: ReceiptInfo(data: tableRow),
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
