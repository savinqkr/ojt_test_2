import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 여기에서 곡선을 정의하십시오.
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
        size.width / 2, // Control point x-coordinate
        size.height, // Control point y-coordinate
        size.width, // End point x-coordinate
        size.height / 2, // End point y-coordinate
      );

    // 선의 모양을 사용자 지정합니다.
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // 곡선을 그립니다
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) => false;
}
