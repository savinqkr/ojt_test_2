import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/editor.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/task_property_window.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';
import 'package:tabbed_view/tabbed_view.dart';

class TabMenuPage extends StatefulWidget {
  const TabMenuPage({Key? key}) : super(key: key);

  @override
  _TabMenuPageState createState() => _TabMenuPageState();
}

class _TabMenuPageState extends State<TabMenuPage> {
  late TabbedViewController controller;

  @override
  void initState() {
    super.initState();

    // 일단 탭 메뉴 내부 데이터는 그대로 옮겨옴. 간략화 필요
    List<TabData> tabs = [
      TabData(
        text: 'tab 1',
        keepAlive: true,
        content: const TabMenuContents(),
      ),
      TabData(
        text: 'tab 2',
        content: const TabMenuContents(),
      ),
      TabData(
        text: 'tab 3',
        content: const TabMenuContents(),
      ),
    ];

    controller = TabbedViewController(tabs);

    TabbedView tabbedView = TabbedView(controller: controller);
  }

// ---------------------- tab style section ----------------------
  @override
  Widget build(BuildContext context) {
    TabbedView tabbedView = TabbedView(
      controller: controller,
    );

    TabbedViewThemeData themeData = TabbedViewThemeData();
    themeData.tabsArea.middleGap = 6;
    Radius radius = const Radius.circular(5);
    BorderRadiusGeometry? borderRadius =
        BorderRadius.only(topLeft: radius, topRight: radius);

    themeData.tab
      ..textStyle = const TextStyle(fontSize: 15)
      ..padding = const EdgeInsets.fromLTRB(45, 8, 30, 8)
      ..buttonsOffset = 8
      ..decoration = BoxDecoration(
          shape: BoxShape.rectangle,
          color: Palette.grey.withAlpha(50), // 탭 버튼 색상
          borderRadius: borderRadius)
      ..selectedStatus.decoration = BoxDecoration(
          color: Palette.darkGrey.withAlpha(50), // 탭 버튼 클릭 시 색상
          borderRadius: borderRadius);

    Widget w = TabbedViewTheme(data: themeData, child: tabbedView);

    return Container(padding: const EdgeInsets.all(0), child: w);
  }
}

// --------------------- tab content 속성에 들어갈 부분 ------------------------
class TabMenuContents extends StatelessWidget {
  const TabMenuContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ----------------- EDITOR ----------------- //
        const Expanded(child: Editor()),
        // ----------------- TASK PROPERTY WINDOW ----------------- //
        GetBuilder<TaskPropertyController>(
          builder: (controller) {
            if (controller.isPropertyWindowVisible) {
              return const Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: TaskPropertyWindow(),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
