import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrinterIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const PrinterIcon({super.key, this.size = 24, this.color = Colors.white});

  @override
  State<PrinterIcon> createState() => _PrinterIconState();
}

class _PrinterIconState extends State<PrinterIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/printer.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
