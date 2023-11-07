import 'package:etos_scale_windows/components/ui/button.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class ScaleInfo extends StatefulWidget {
  final String scaleData;
  final Function()? onClick;
  final Function(String value)? setType;
  final bool isLoading;
  const ScaleInfo({
    Key? key,
    this.onClick,
    this.setType,
    required this.scaleData,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<ScaleInfo> createState() => _ScaleInfoState();
}

class _ScaleInfoState extends State<ScaleInfo> {
  late List<bool> isSelected = [true];
  @override
  void initState() {
    super.initState();
    isSelected = [true, false];
  }

  @override
  Widget build(BuildContext context) {
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: primary,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //       ),
            //       onPressed: widget.onClick,
            //       child: Container(
            //         margin:
            //             const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            //         child: Text(
            //           'Орох',
            //           style: TextStyle(
            //             color: white,
            //             fontWeight: FontWeight.w500,
            //             fontSize: 16,
            //           ),
            //         ),
            //       ),
            //     ),
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: primary,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //       ),
            //       onPressed: widget.onClick,

            //       // widget.onClick;
            //       child: Container(
            //         margin:
            //             const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            //         child: Text(
            //           'Гарах',
            //           style: TextStyle(
            //             color: white,
            //             fontWeight: FontWeight.w500,
            //             fontSize: 16,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 40,
              child: ToggleButtons(
                borderColor: textcolor,
                fillColor: colorBlue,
                borderWidth: 1,
                selectedBorderColor: Colors.black,
                borderRadius: BorderRadius.circular(10),
                selectedColor: white,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                  if (index == 0) {
                    widget.setType?.call('IN');
                  } else if (index == 1) {
                    widget.setType?.call('OUT');
                  }
                },
                isSelected: isSelected,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: const Text(
                      'Орох',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: const Text(
                      'Гарах',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              labelText: 'Баталгаажуулах',
              color: colorBlue,
              onPress: widget.onClick!,
            ),
          ],
        ),
      ),
    );
  }
}
