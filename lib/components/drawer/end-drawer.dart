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

  void _loadSerialPorts() async {
    final availablePorts = await SerialPort.availablePorts;

    if (availablePorts.isEmpty) {
      print('No serial ports available.');
    } else {
      print(availablePorts);
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
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 400,
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(
                          'Пүү сонгох',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: 400,
                        child: DropdownButtonFormField(
                            onChanged: (value) {},
                            dropdownColor: lightgrey,
                            itemHeight: 70,
                            menuMaxHeight: 400,
                            elevation: 2,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            icon: Icon(
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
                            items: [
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
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(
                          'Хэвлэх төхөөрөмж сонгох',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: 400,
                        child: DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              value = selectedPort;
                              print(value);
                            });
                            ;
                          },
                          dropdownColor: lightgrey,
                          itemHeight: 70,
                          menuMaxHeight: 400,
                          elevation: 2,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          icon: Icon(
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
                  Container(
                    width: 400,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print(selectedPort);
                        });
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44),
                          color: backgroundColor,
                        ),
                        child: Center(
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
