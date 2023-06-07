import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define your curved line here
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
        size.width / 2, // Control point x-coordinate
        size.height, // Control point y-coordinate
        size.width, // End point x-coordinate
        size.height / 2, // End point y-coordinate
      );

    // Customize the appearance of the line
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw the curved line
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) => false;
}
