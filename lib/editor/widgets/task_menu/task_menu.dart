import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/search_bar.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/task_list.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/favorite_tap_test.dart';

class TaskMenu extends StatefulWidget {
  const TaskMenu({super.key});

  @override
  State<TaskMenu> createState() => _TaskMenuState();
}

class _TaskMenuState extends State<TaskMenu> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Palette.white,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SearchBarWidget(
            isFavorite: _isFavorite,
            onFavoriteChanged: (value) {
              setState(() {
                _isFavorite = value;
              });
            },
          ),
          _isFavorite ? FavoriteTap() : const TaskList(),
        ],
      ),
    );
  }
}


// ** 임시로 작성한 코드입니다. ** //