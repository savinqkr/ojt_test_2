import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final double textSize;
  final Color textColor;
  final Color buttonColor;

  const Button({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.textSize,
    required this.textColor,
    required this.buttonColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Center(
          child: Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.textSize,
        ),
      )),
    );
  }
}
