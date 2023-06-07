import 'package:flutter/material.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/task_accordion_page.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: TaskAccordionPage(),
      ),
    );
  }
}

// ** 임시로 작성한 코드입니다. ** //
/* 
 - 아코디언 컴포넌트
 - 태스크 컴포넌트

 이렇게 두가지를 만들어서
 아코디언 컴포넌트 안에 태스크 컴포넌트를 넣어 사용하면 좋을것 같습니다 : )

 더 좋은 방법이 있다면 적용해주세요~!
 
 */