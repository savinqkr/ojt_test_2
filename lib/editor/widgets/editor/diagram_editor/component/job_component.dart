import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/base_job_body.dart';

class JobComponentBody extends StatelessWidget {
  final ComponentData componentData;

  const JobComponentBody({super.key, required this.componentData});

  @override
  Widget build(BuildContext context) {
    return BaseJobBody(
      componentData: componentData,
      componentPainter: TaskPainter(
        color: componentData.data.color,
        borderColor: componentData.data.borderColor,
        borderWidth: componentData.data.borderWidth,
      ),
    );
  }
}

class TaskPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;
  Size componentSize = const Size(70, 70);

  TaskPainter({
    this.color = Palette.white,
    this.borderColor = const Color.fromRGBO(95, 95, 95, 0),
    this.borderWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    componentSize = const Size(70, 70);

    Path path = componentPath();

    canvas.drawPath(path, paint);

    if (borderWidth > 0) {
      paint
        ..style = PaintingStyle.stroke
        ..color = const Color.fromARGB(0, 146, 146, 146)
        ..strokeWidth = borderWidth;

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = componentPath();
    return path.contains(position);
  }

  Path componentPath() {
    Path path = Path();

    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          componentSize.width,
          componentSize.height,
        ),
        const Radius.circular(5),
      ),
    );

    return path;
  }
}
