import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/task.dart';

// 아코디언 리스트들을 묶는 페이지
// accordion package 사용

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({Key? key}) : super(key: key);

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
                (index) => Task(
                    icon: FavoriteTaskList.itemList[index].icon,
                    text: FavoriteTaskList.itemList[index].name),
              ),
            ),
          ),
        ],
      );
}
