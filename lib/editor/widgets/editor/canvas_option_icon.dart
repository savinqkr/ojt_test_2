import 'package:flutter/material.dart';

class CanvasOptionIcon extends StatelessWidget {
  final double size;
  final Icon icon;
  final String tooltip;
  final Function onPressed;

  const CanvasOptionIcon(
      {super.key,
      required this.size,
      required this.icon,
      required this.tooltip,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
        tooltip: tooltip,
        onPressed: () {
          onPressed();
        },
        padding: const EdgeInsets.all(4),
        icon: icon,
      ),
    );
  }
}
