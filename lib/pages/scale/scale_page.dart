import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:etos_scale_windows/components/container/container.dart';
import 'package:etos_scale_windows/components/information/information_card.dart';
import 'package:etos_scale_windows/components/trailer/trailer.dart';
import 'package:etos_scale_windows/widgets/colors.dart';
import 'package:libserialport/libserialport.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:etos_scale_windows/widgets/form_textfield.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

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

  late final player = Player();
  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();

    player.open(Media('rtsp://admin:pi@123456@192.168.1.246:554'), play: true);

    //   player.open(
    //       Media(
    //           'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
    //       play: true);
  }

  @override
  void dispose() async {
    player.dispose();
    super.dispose();
  }

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 190, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: backgroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomContainer(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Trailer(),
                  const SizedBox(
                    height: 15,
                  ),
                  InformationCard(scaleData: scaleData),
                  // Center(
                  //   child: SizedBox(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.width * 9.0 / 16.0,
                  //     // Use [Video] widget to display video output.
                  //     child: Video(controller: controller),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
