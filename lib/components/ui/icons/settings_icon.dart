import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const SettingsIcon({super.key, this.size = 24, this.color = Colors.white});

  @override
  State<SettingsIcon> createState() => _SettingsIconState();
}

class _SettingsIconState extends State<SettingsIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/settings.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
