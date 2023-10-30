import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String labelText;
  final Color? labelColor;
  final Color color;
  final Function() onPress;

  const Button(
      {super.key,
      required this.labelText,
      required this.color,
      this.labelColor = Colors.white,
      required this.onPress});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.color,
        ),
        child: Center(
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: widget.labelColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
