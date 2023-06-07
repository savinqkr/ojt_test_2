import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';

class BaseComponentBody extends StatelessWidget {
  final ComponentData componentData;
  final CustomPainter componentPainter;

  const BaseComponentBody(
      {super.key, required this.componentData, required this.componentPainter});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final MyComponentData customData = componentData.data;

    return GestureDetector(
      child: CustomPaint(
        painter: componentPainter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Text('ID : ${componentData.id.substring(0, 4)}'),
              Text(componentData.parentId == null
                  ? '-'
                  : 'parent : ${componentData.parentId?.substring(0, 4)}'),
            ],
          ),
        ),
      ),
    );
  }
}
