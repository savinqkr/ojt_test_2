import 'package:accordion/accordion.dart';
import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';

// 하나의 아코디언 리스트를 만들 수 있는 아코디언 폼

class AccordionForm extends StatelessWidget {
  final MyPolicySet myPolicySet;
  final double maxOpenSections;
  final String headerName;
  final List<ItemData> targetList;
  final IconData? icon;
  final double? paddingListTop;
  final EdgeInsets? headerPadding;

  const AccordionForm({
    Key? key,
    required this.maxOpenSections,
    required this.headerName,
    required this.targetList,
    this.paddingListTop,
    this.headerPadding,
    this.icon,
    required this.myPolicySet,
  }) : super(key: key);

  @override
  build(context) => Expanded(
        child: Accordion(
          maxOpenSections: maxOpenSections.toInt(), //동시에 열려있을 수 있는 아코디언 수

          headerBackgroundColor: Palette.white,
          headerBackgroundColorOpened: Palette.white,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          headerBorderRadius: 3,
          paddingListTop: paddingListTop!,
          openAndCloseAnimation: true,

          scaleWhenAnimating: false, // scale 애니메이션 제거

          // targetLists의 데이터로 accordion 생성
          children: [
            AccordionSection(
              isOpen: true,
              rightIcon: Icon(icon),
              contentBorderColor: Palette.white,
              header: Text(headerName),
              headerPadding: headerPadding,
              content: Wrap(
                children: List.generate(
                  targetList.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: DraggableComponent(
                        myPolicySet: myPolicySet,
                        componentData: getComponentData(targetList[index].name),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );

  ComponentData getComponentData(String componentType) {
    return ComponentData(
      size: const Size(70, 70),
      minSize: const Size(70, 70),
      data: MyComponentData(
        color: Colors.white,
        borderColor: Colors.black,
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
    Key? key,
    required this.myPolicySet,
    required this.componentData,
  }) : super(key: key);

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
