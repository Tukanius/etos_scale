import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show Key, kDebugMode;
import 'package:etos_scale_windows/components/container/container.dart';
// import 'package:etos_scale_windows/components/information/information-card.dart';
import 'package:etos_scale_windows/components/trailer/trailer.dart';
import 'package:etos_scale_windows/widgets/colors.dart';
import 'package:libserialport/libserialport.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:etos_scale_windows/widgets/form_textfield.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/Butterfly-209.mp4');
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  afterFirstLayout(BuildContext context) {
    final name = SerialPort.availablePorts.first;
    final port = SerialPort(name);
    if (!port.openReadWrite()) {
      if (kDebugMode) {
        print(SerialPort.lastError);
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
                  FormBuilder(
                    key: fbKey,
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: FormTextField(
                                textColor: white,
                                labelText: "Гэрээний дугаар",
                                inputType: TextInputType.text,
                                name: 'contractnumber',
                                hintText: '000000000',
                                color: lightgrey,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 3,
                              child: FormTextField(
                                textColor: white,
                                labelText: "Пүүний баримт",
                                inputType: TextInputType.text,
                                name: 'document',
                                hintText: '000000000',
                                color: lightgrey,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: FormTextField(
                                textColor: white,
                                labelText: "Худалдаалагч",
                                inputType: TextInputType.text,
                                name: 'trader',
                                hintText: '000000000',
                                color: lightgrey,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 3,
                              child: FormTextField(
                                textColor: white,
                                labelText: "Худалдан авагч",
                                inputType: TextInputType.text,
                                name: 'buyer',
                                hintText: '000000000',
                                color: lightgrey,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              flex: 3,
                              child: FormTextField(
                                textColor: white,
                                labelText: "Нүүрсний төрөл",
                                inputType: TextInputType.text,
                                name: 'number12',
                                hintText: '000000000',
                                color: lightgrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                  // InformationCard(scaleData: scaleData),
                  FutureBuilder<bool>(
                    future: started(),
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.data ?? false) {
                        return AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        );
                      } else {
                        return const Text('waiting for video to load');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
