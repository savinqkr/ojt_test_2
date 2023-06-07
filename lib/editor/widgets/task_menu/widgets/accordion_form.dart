import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/task.dart';

// 하나의 아코디언 리스트를 만들 수 있는 아코디언 폼

class AccordionForm extends StatelessWidget {
  final double maxOpenSections;
  final String headerName;
  final List<ItemData> targetList;
  final IconData? icon;
  final double paddingListTop;
  final EdgeInsets headerPadding;

  const AccordionForm({
    Key? key,
    required this.maxOpenSections,
    required this.headerName,
    required this.targetList,
    required this.paddingListTop,
    required this.headerPadding,
    this.icon,
  }) : super(key: key);

  @override
  build(context) => Expanded(
        child: Accordion(
          maxOpenSections: 2, //동시에 열려있을 수 있는 아코디언 수

          headerBackgroundColor: Palette.white,
          headerBackgroundColorOpened: Palette.white,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          headerBorderRadius: 3,
          paddingListTop: paddingListTop,

          scaleWhenAnimating: false, // scale 애니메이션 제거
          openAndCloseAnimation: true,

          // taskLists의 데이터로 accordion 생성
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
                  (index) => Task(
                      icon: targetList[index].icon,
                      text: targetList[index].name),
                ),
              ),
            ),
          ],
        ),
      );
}
