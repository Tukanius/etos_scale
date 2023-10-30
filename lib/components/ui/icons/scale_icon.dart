import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScaleIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const ScaleIcon({super.key, this.size = 28, this.color = Colors.white});

  @override
  State<ScaleIcon> createState() => _ScaleIconState();
}

class _ScaleIconState extends State<ScaleIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/scale.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
