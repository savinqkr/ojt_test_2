import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/bean_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/bean_left_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/bean_right_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/bend_left_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/bend_right_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/crystal_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/document_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/group_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/hexagon_horizontal_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/hexagon_vertical_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/job_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/no_corner_rect_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/oval_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/rect_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/rhomboid_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/round_rect_component.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/component/task_component.dart';

mixin MyComponentDesignPolicy implements ComponentDesignPolicy {
  @override
  Widget showComponentBody(ComponentData componentData) {
    switch (componentData.type) {
      case 'rect':
        return RectBody(componentData: componentData);
      case 'round_rect':
        return RoundRectBody(componentData: componentData);
      case 'oval':
        return OvalBody(componentData: componentData);
      case 'crystal':
        return CrystalBody(componentData: componentData);
      case 'body':
        return RectBody(componentData: componentData);
      case 'rhomboid':
        return RhomboidBody(componentData: componentData);
      case 'bean':
        return BeanBody(componentData: componentData);
      case 'bean_left':
        return BeanLeftBody(componentData: componentData);
      case 'bean_right':
        return BeanRightBody(componentData: componentData);
      case 'document':
        return DocumentBody(componentData: componentData);
      case 'hexagon_horizontal':
        return HexagonHorizontalBody(componentData: componentData);
      case 'hexagon_vertical':
        return HexagonVerticalBody(componentData: componentData);
      case 'bend_left':
        return BendLeftBody(componentData: componentData);
      case 'bend_right':
        return BendRightBody(componentData: componentData);
      case 'no_corner_rect':
        return NoCornerRectBody(componentData: componentData);
      // case 'junction':
      //   return OvalBody(componentData: componentData);
      // default:
      //   return BeanBody(componentData: componentData);
      // break;
      // ----------------------------------------------------------------- //
      case 'starter':
        return TaskComponentBody(componentData: componentData);
      case 'schedule':
        return TaskComponentBody(componentData: componentData);
      case 'runProgram':
        return TaskComponentBody(componentData: componentData);
      case 'jobStatus':
        return TaskComponentBody(componentData: componentData);
      case 'executeJob':
        return TaskComponentBody(componentData: componentData);
      case 'and':
        return TaskComponentBody(componentData: componentData);
      case 'or':
        return TaskComponentBody(componentData: componentData);
      case 'sleep':
        return TaskComponentBody(componentData: componentData);
      case 'job':
        return JobComponentBody(componentData: componentData);
      case 'group':
        return GroupComponentBody(componentData: componentData);
      default:
        return TaskComponentBody(componentData: componentData);
    }
  }
}
