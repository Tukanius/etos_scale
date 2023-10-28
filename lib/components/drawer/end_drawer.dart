import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/widgets/colors.dart';
import 'package:libserialport/libserialport.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late String selectedPort;

  @override
  void initState() {
    super.initState();
    _loadSerialPorts();
  }

  void _loadSerialPorts() {
    final availablePorts = SerialPort.availablePorts;

    if (availablePorts.isEmpty) {
      if (kDebugMode) {
        print('No serial ports available.');
      }
    } else {
      if (kDebugMode) {
        print(availablePorts);
      }
      setState(() {
        selectedPort = availablePorts[0];
      });
    }
  }

  bool isSubmit = false;

  logout() async {
    setState(() {
      isSubmit = true;
    });
    setState(() {
      isSubmit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: darkgrey,
              ),
              width: 600,
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
                        child: const Text(
                          'Пүү сонгох',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: DropdownButtonFormField(
                            onChanged: (value) {},
                            dropdownColor: lightgrey,
                            itemHeight: 70,
                            menuMaxHeight: 400,
                            elevation: 2,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: white,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              hintStyle: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 14),
                              filled: true,
                              fillColor: lightgrey,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                enabled: true,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "COM6",
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        width: 400,
                        margin: const EdgeInsets.only(top: 30, bottom: 10),
                        child: const Text(
                          'Хэвлэх төхөөрөмж сонгох',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w700,
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
                              value = selectedPort;
                              if (kDebugMode) {
                                print(value);
                              }
                            });
                          },
                          dropdownColor: lightgrey,
                          itemHeight: 70,
                          menuMaxHeight: 400,
                          elevation: 2,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            hintStyle: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 14),
                            filled: true,
                            fillColor: lightgrey,
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
                              .map((portName) => DropdownMenuItem<String>(
                                    value: portName,
                                    child: Text(portName),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 400,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (kDebugMode) {
                            print(selectedPort);
                          }
                        });
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44),
                          color: backgroundColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Хадгалах',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
