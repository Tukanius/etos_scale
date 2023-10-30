import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const NetworkIcon({super.key, this.size = 28, this.color = Colors.white});

  @override
  State<NetworkIcon> createState() => _NetworkIconState();
}

class _NetworkIconState extends State<NetworkIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/network.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
