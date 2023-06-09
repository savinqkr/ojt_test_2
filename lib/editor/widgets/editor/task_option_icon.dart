import 'package:flutter/material.dart';

class TaskOptionIcon extends StatelessWidget {
  final double size;
  final BoxShape shape;
  final String tooltip;
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final Function onPressed;

  const TaskOptionIcon({
    super.key,
    required this.size,
    required this.shape,
    required this.tooltip,
    required this.iconData,
    required this.iconColor,
    required this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: shape,
      ),
      child: IconButton(
        tooltip: tooltip,
        onPressed: () {
          onPressed();
        },
        padding: const EdgeInsets.all(0),
        icon: Icon(
          iconData,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
