import 'package:etos_scale_windows/components/controller/listen.dart';
import 'package:etos_scale_windows/components/ui/button.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class ScaleInfoArguments {
  ListenController listenController;
  ScaleInfoArguments({
    required this.listenController,
  });
}

class ScaleInfo extends StatefulWidget {
  final ListenController listenController;
  final String scaleData;
  final Function()? onClick;
  final bool isLoading;
  const ScaleInfo({
    Key? key,
    this.onClick,
    required this.scaleData,
    required this.isLoading,
    required this.listenController,
  }) : super(key: key);

  @override
  State<ScaleInfo> createState() => _ScaleInfoState();
}

class _ScaleInfoState extends State<ScaleInfo> {
  bool isSelected1 = false;

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
            Button(
              isLoading: widget.isLoading,
              labelText: "Баталгаажуулах",
              color: colorSecondary,
              onPress: widget.onClick!,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Орох',
                  style: TextStyle(
                    fontSize: 16,
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  activeColor: Colors.white,
                  value: isSelected1,
                  onChanged: (bool value) {
                    setState(() {
                      isSelected1 = !isSelected1;
                      if (isSelected1 == false) {
                        widget.listenController.changeVariable("IN");
                      }
                      if (isSelected1 == true) {
                        widget.listenController.changeVariable("OUT");
                      }
                    });
                  },
                ),
                Text(
                  'Гарах',
                  style: TextStyle(
                    fontSize: 16,
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
