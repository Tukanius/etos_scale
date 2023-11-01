import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String labelText;
  final Color? labelColor;
  final Color color;
  final Function() onPress;
  final bool? isLoading;

  const Button({
    super.key,
    required this.labelText,
    required this.color,
    this.labelColor = Colors.white,
    required this.onPress,
    this.isLoading,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: widget.onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.isLoading == true)
            Container(
              margin: const EdgeInsets.only(
                right: 15,
              ),
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: white,
                strokeWidth: 2.5,
              ),
            ),
          Text(
            widget.labelText,
            style: TextStyle(
              color: widget.labelColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
