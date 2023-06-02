import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/search_bar.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/task_list.dart';

class TaskMenu extends StatelessWidget {
  const TaskMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      color: Palette.mint.withOpacity(0.3),
      child: const Column(children: [
        SizedBox(
          height: 20,
        ),
        SearchBarWidget(),
        SizedBox(
          height: 20,
        ),
        TaskList(),
      ]),
    );
  }
}


// ** 임시로 작성한 코드입니다. ** //