// ignore_for_file: unused_local_variable

import 'package:accordion/accordion.dart';
import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';

// 같은 주제의 task끼리 accordion으로 묶어서 보여주는 위젯

class TaskAccordionPage extends StatefulWidget {
  final MyPolicySet myPolicySet;

  const TaskAccordionPage({Key? key, required this.myPolicySet})
      : super(key: key);

  @override
  State<TaskAccordionPage> createState() => _TaskAccordionPageState();
}

class _TaskAccordionPageState extends State<TaskAccordionPage> {
  List<bool> accordionActions = []; // accordion 섹션의 열림,닫힘 여부를 저장하는 리스트

  @override
  void initState() {
    super.initState();
    // 각 아코디언 섹션에 대한 초기 값 설정
    accordionActions = List<bool>.filled(taskLists.length, false);
  }

  void openAccordionAction(int index) {
    setState(() {
      accordionActions[index] = true;
    });
  }

  void closeAccordionAction(int index) {
    setState(() {
      accordionActions[index] = false;
    });
  }
//
//
// --------------------------- * 구현 section * -----------------------------

  @override
  build(context) => Accordion(
        maxOpenSections: 2, //동시에 열려있을 수 있는 아코디언 수

        headerBackgroundColor: Palette.white,
        headerBackgroundColorOpened: Palette.white,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        headerBorderRadius: 3,

        scaleWhenAnimating: false, // scale 애니메이션 제거
        openAndCloseAnimation: true,

// taskLists의 데이터로 accordion 생성
        children: taskLists
            .map(
              (taskListEntry) => AccordionSection(
                isOpen: taskLists.first == taskListEntry,
                rightIcon: const Icon(MaterialSymbols.expand_more,
                    color: Palette.black),
                contentBorderColor: Palette.white,
                header: Text(
                  taskListEntry.keys.first,
                  style: const TextStyle(
                    color: Palette.darkGrey,
                  ),
                ),
                content: Wrap(
                  children: taskListEntry.values.first.map(
                    (item) {
                      var tasks = [...widget.myPolicySet.bodies];
                      var componentData = getComponentData(item.name);
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        // child: Task(
                        //   icon: item.icon,
                        //   name: item.name,
                        // ),
                        child: DraggableComponent(
                          myPolicySet: widget.myPolicySet,
                          componentData: componentData,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            )
            .toList(),
      );

  ComponentData getComponentData(String componentType) {
    return ComponentData(
      size: const Size(70, 70),
      minSize: const Size(70, 70),
      data: MyComponentData(
        color: Colors.white,
        borderColor: Palette.darkGrey,
        borderWidth: 1.5,
      ),
      type: componentType,
    );
  }
}

class DraggableComponent extends StatelessWidget {
  final MyPolicySet myPolicySet;
  final ComponentData componentData;

  const DraggableComponent({
    super.key,
    required this.myPolicySet,
    required this.componentData,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<ComponentData>(
      affinity: Axis.horizontal,
      ignoringFeedbackSemantics: true,
      data: componentData,
      childWhenDragging: myPolicySet.showComponentBody(componentData),
      feedback: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: componentData.size.width,
          height: componentData.size.height,
          child: myPolicySet.showComponentBody(componentData),
        ),
      ),
      child: myPolicySet.showComponentBody(componentData),
    );
  }
}
