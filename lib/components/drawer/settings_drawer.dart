import 'package:etos_scale_windows/components/ui/button.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/scale/scale_page.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:provider/provider.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> with AfterLayoutMixin {
  bool isSubmit = false;
  String? selectedSerialPort;
  bool isLoading = false;

  @override
  afterFirstLayout(BuildContext context) async {
    final port = await Provider.of<UserProvider>(context, listen: false)
        .getSelectedSerialPort();

    setState(() {
      selectedSerialPort = port;
    });
  }

  onChangeSerialPort(String port) async {
    await Provider.of<UserProvider>(context, listen: false)
        .setSelectedSerialPort(port);
  }

  showSuccess(ctx) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.center,
            child: Container(
              width: 400,
              height: 450,
              margin: const EdgeInsets.only(top: 75),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Амжилттай',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'COM PORT Амжилттай солигдлоо.',
                    textAlign: TextAlign.center,
                  ),
                  ButtonBar(
                    buttonMinWidth: 100,
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text(
                          "Буцах",
                          style: TextStyle(color: black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: gray101,
            ),
            width: 500,
            height: MediaQuery.of(context).size.height - 60,
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 400,
                      margin: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        'Пүү сонгох',
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: DropdownButtonFormField(
                        onChanged: (value) {
                          onChangeSerialPort(value!);
                        },
                        dropdownColor: white,
                        value: selectedSerialPort,
                        itemHeight: 70,
                        menuMaxHeight: 400,
                        elevation: 2,
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        icon: SerialPort.availablePorts.isEmpty
                            ? const SizedBox()
                            : Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: black,
                              ),
                        disabledHint: Text(
                          'Холболт салсан',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          hintText: 'COM Сонгох',
                          hintStyle: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: SerialPort.availablePorts
                            .map(
                              (portName) => DropdownMenuItem<String>(
                                value: portName,
                                child: Text(
                                  portName,
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      width: 400,
                      margin: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        'Хэвлэх төхөөрөмж сонгох',
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: DropdownButtonFormField(
                        onChanged: (value) {
                          setState(() {
                            value = selectedSerialPort;
                            if (kDebugMode) {
                              print(value);
                            }
                          });
                        },
                        dropdownColor: white,
                        itemHeight: 70,
                        menuMaxHeight: 400,
                        elevation: 2,
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: black,
                        ),
                        disabledHint: Text(
                          'Холболт салсан',
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          hintText: 'Printer Сонгох',
                          hintStyle: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            enabled: true,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "Printer",
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: 400,
                  child: Button(
                    labelText: 'Хадгалах',
                    color: colorSecondary,
                    onPress: () {
                      Navigator.of(context).pushNamed(ScalePage.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
