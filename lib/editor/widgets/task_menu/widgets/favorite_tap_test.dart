import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/task.dart';

// 즐겨찾기에 등록된 task들 보여주는 위젯

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({Key? key}) : super(key: key);

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
                (index) => Task(
                    icon: FavoriteTaskList.itemList[index].icon,
                    name: FavoriteTaskList.itemList[index].name),
              ),
            ),
          ),
        ],
      );
}
