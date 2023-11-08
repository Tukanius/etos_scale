import 'package:etos_scale_windows/components/ui/button.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScaleInfo extends StatefulWidget {
  final String scaleData;
  final Function()? onSubmit;
  final bool isLoading;
  final Function(String value)? setType;
  final Function(String value)? setWeightType;

  const ScaleInfo({
    Key? key,
    this.onSubmit,
    required this.scaleData,
    required this.isLoading,
    this.setType,
    this.setWeightType,
  }) : super(key: key);

  @override
  State<ScaleInfo> createState() => _ScaleInfoState();
}

class _ScaleInfoState extends State<ScaleInfo> {
  int index = 1;
  int typeIndex = 1;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false).user;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: colorYellow),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: white.withOpacity(0.4),
              ),
              child: Center(
                child: Text(
                  widget.scaleData,
                  style: TextStyle(
                    color: black,
                    fontSize: 56,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            user?.scaleType == "IN" ||
                    user?.scaleType == "OUT" ||
                    user?.scaleType == "BOTH"
                ? Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 1;
                                      widget.setType?.call('IN');
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor:
                                        index == 1 ? colorBlue : colorYellow,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Орох',
                                      style: TextStyle(
                                        color: index == 1 ? white : black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      index = 2;
                                      widget.setType?.call('OUT');
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor:
                                        index == 2 ? colorBlue : colorYellow,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Гарах',
                                      style: TextStyle(
                                        color: index == 2 ? white : black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                // Column(
                //     children: [
                //       ToggleButtons(
                //         borderColor: textcolor,
                //         fillColor: colorBlue,
                //         borderWidth: 1,
                //         selectedBorderColor: Colors.black,
                //         borderRadius: BorderRadius.circular(10),
                //         selectedColor: white,
                //         onPressed: (int index) {
                //           setState(() {
                //             for (int i = 0; i < type.length; i++) {
                //               type[i] = i == index;
                //             }
                //           });
                //           if (index == 0) {
                //             widget.setType?.call('IN');
                //           } else if (index == 1) {
                //             widget.setType?.call('OUT');
                //           }
                //         },
                //         isSelected: type,
                //         children: <Widget>[
                //           Container(
                //             child: const Text(
                //               'Орох',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 16,
                //               ),
                //             ),
                //           ),
                //           Container(
                //             child: const Text(
                //               'Гарах',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 16,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //     ],
                //   )

                : const SizedBox(),
            user?.weightType == "BOTH"
                ? Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      typeIndex = 1;
                                      widget.setWeightType?.call('LADED');
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: typeIndex == 1
                                        ? colorBlue
                                        : colorYellow,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Ачаатай',
                                      style: TextStyle(
                                        color: typeIndex == 1 ? white : black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      typeIndex = 2;
                                      widget.setWeightType?.call('INLADED');
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: typeIndex == 2
                                        ? colorBlue
                                        : colorYellow,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Ачаагүй',
                                      style: TextStyle(
                                        color: typeIndex == 2 ? white : black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            Button(
              labelText: 'Баталгаажуулах',
              color: colorBlue,
              onPress: widget.onSubmit!,
            ),
          ],
        ),
      ),
    );
  }
}
