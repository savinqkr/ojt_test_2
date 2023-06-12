import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/search_bar.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/task_list.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/favorite_tap_test.dart';

class TaskMenu extends StatefulWidget {
  final MyPolicySet myPolicySet;

  const TaskMenu({super.key, required this.myPolicySet});

  @override
  State<TaskMenu> createState() => _TaskMenuState();
}

class _TaskMenuState extends State<TaskMenu> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SearchBarWidget(
            myPolicySet: widget.myPolicySet,
            isFavorite: _isFavorite,
            onFavoriteChanged: (value) {
              setState(() {
                _isFavorite = value;
              });
            },
          ),
          _isFavorite
              ? FavoriteTap(myPolicySet: widget.myPolicySet)
              : TaskList(myPolicySet: widget.myPolicySet),
        ],
      ),
    );
  }
}
