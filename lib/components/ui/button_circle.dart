import 'package:flutter/material.dart';

class ButtonCircle extends StatefulWidget {
  final Color color;
  final StatefulWidget icon;
  final Function() onPress;

  const ButtonCircle(
      {super.key,
      required this.color,
      required this.onPress,
      required this.icon});

  @override
  State<ButtonCircle> createState() => _ButtonCircleState();
}

class _ButtonCircleState extends State<ButtonCircle> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: CircleAvatar(backgroundColor: widget.color, child: widget.icon),
    );
  }
}
