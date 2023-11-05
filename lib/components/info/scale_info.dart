import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class ScaleInfo extends StatefulWidget {
  final String scaleData;
  final Function()? onClick;
  final bool isLoading;
  const ScaleInfo({
    Key? key,
    this.onClick,
    required this.scaleData,
    required this.isLoading,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: widget.onClick,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      'Орох',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: widget.onClick,

                  // widget.onClick;
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Text(
                      'Гарах',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
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
