import 'package:flutter/material.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/task_accordion_page.dart';

class TaskList extends StatelessWidget {
  final MyPolicySet myPolicySet;

  const TaskList({super.key, required this.myPolicySet});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: TaskAccordionPage(myPolicySet: myPolicySet),
      ),
    );
  }
}
