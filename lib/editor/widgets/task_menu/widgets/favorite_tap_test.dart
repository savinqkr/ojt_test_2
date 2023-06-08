import 'package:accordion/accordion.dart';
import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';

// 즐겨찾기에 등록된 task들 보여주는 위젯

class FavoriteTap extends StatelessWidget {
  final MyPolicySet myPolicySet;

  const FavoriteTap({Key? key, required this.myPolicySet}) : super(key: key);

  @override
  build(context) => Accordion(
        maxOpenSections: 2,
        headerBackgroundColor: Palette.white,
        headerBackgroundColorOpened: Palette.white,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        headerBorderRadius: 3,
        scaleWhenAnimating: false,
        openAndCloseAnimation: true,
        children: [
          AccordionSection(
            isOpen: true,
            rightIcon:
                const Icon(MaterialSymbols.expand_more, color: Palette.black),
            contentBorderColor: Palette.white,
            header: const Text('즐겨찾기'),
            content: Wrap(
              children: List.generate(
                FavoriteTaskList.itemList.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: DraggableComponent(
                      myPolicySet: myPolicySet,
                      componentData: getComponentData(
                          FavoriteTaskList.itemList[index].name),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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
