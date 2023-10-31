import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WifiIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const WifiIcon({super.key, this.size = 24, this.color = Colors.white});

  @override
  State<WifiIcon> createState() => _WifiIconState();
}

class _WifiIconState extends State<WifiIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/wifi.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
