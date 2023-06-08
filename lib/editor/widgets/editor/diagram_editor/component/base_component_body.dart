import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
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
              Text('Type : ${componentData.type}'),
              Container(
                child: getTaskIcon(componentData.type),
              ),
              Text(componentData.parentId == null
                  ? '-'
                  : 'parent : ${componentData.parentId?.substring(0, 4)}'),
            ],
          ),
        ),
      ),
    );
  }

  Icon getTaskIcon(String? taskType) {
    switch (taskType) {
      case 'starter':
        return const Icon(MaterialSymbols.where_to_vote);
      case 'schedule':
        return const Icon(MaterialSymbols.calendar_month);
      case 'jobStatus':
        return const Icon(MaterialSymbols.hourglass_empty);
      case 'executeJob':
        return const Icon(MaterialSymbols.play_arrow_filled);
      case 'and':
        return const Icon(MaterialSymbols.terminal);
      case 'or':
        return const Icon(MaterialSymbols.terminal);
      case 'sleep':
        return const Icon(MaterialSymbols.dark_mode);
      default:
        return const Icon(MaterialSymbols.terminal);
    }
  }
}
