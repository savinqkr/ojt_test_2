import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/task.dart';

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 0, 5),
              child: Text(
                '즐겨찾기',
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(3),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                FavoriteTaskList.itemList.length,
                (index) => Task(
                    icon: FavoriteTaskList.itemList[index].icon,
                    text: FavoriteTaskList.itemList[index].name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
