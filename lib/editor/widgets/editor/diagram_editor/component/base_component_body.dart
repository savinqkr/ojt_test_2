import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/task.dart';

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
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              color: Palette.white,
              border: Border.all(
                width: 1.2,
                color: const Color.fromRGBO(95, 95, 95, 1),
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Task(
              icon: getTaskIcon(componentData.type),
              name: componentData.type.toString(),
            ),
          ),
        ),

        // child: Container(
        //   width: 70,
        //   height: 70,
        //   color: Palette.mint.withOpacity(0.5),
        //   child: Center(
        //     child: Text(componentData.type.toString()),
        //   ),
        // ),
      ),
    );
  }

  Icon getTaskIcon(String? taskType) {
    switch (taskType) {
      case 'starter':
        return const Icon(MaterialSymbols.where_to_vote);
      case 'schedule':
        return const Icon(MaterialSymbols.calendar_month);
      case 'runProgram':
        return const Icon(MaterialSymbols.terminal);
      case 'jobStatus':
        return const Icon(MaterialSymbols.hourglass_empty);
      case 'executeJob':
        return const Icon(MaterialSymbols.play_arrow_filled);
      case 'and':
        return const Icon(MaterialSymbols.adjust);
      case 'or':
        return const Icon(MaterialSymbols.lens);
      case 'sleep':
        return const Icon(MaterialSymbols.dark_mode);
      default:
        return const Icon(MaterialSymbols.terminal);
    }
  }
}
