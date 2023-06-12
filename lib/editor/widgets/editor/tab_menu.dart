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
        text: 'tab 2',
        content: Container(
          color: Palette.white,
          child: Row(
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
          ),
        ),
      ),
      TabData(
        text: 'tab 2',
        content: Container(
          color: Palette.white,
          child: Row(
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
          ),
        ),
      ),
      TabData(
        text: 'tab 3',
        content: Container(
          color: Palette.white,
          child: Row(
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
          ),
        ),
      ),
    ];

    controller = TabbedViewController(tabs);

    TabbedView tabbedView = TabbedView(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    TabbedView tabbedView = TabbedView(controller: controller);

    TabbedViewThemeData themeData = TabbedViewThemeData();
    themeData.tabsArea.middleGap = 6;
    Radius radius = const Radius.circular(5);
    BorderRadiusGeometry? borderRadius =
        BorderRadius.only(topLeft: radius, topRight: radius);

    themeData.tab
      ..padding = const EdgeInsets.fromLTRB(40, 7, 30, 7)
      ..buttonsOffset = 8
      ..decoration = BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color.fromRGBO(248, 248, 248, 1), // 탭 버튼 색상
          borderRadius: borderRadius)
      ..selectedStatus.decoration = BoxDecoration(
          color: const Color.fromRGBO(233, 233, 233, 1), // 탭 버튼 클릭 시 색상
          borderRadius: borderRadius)
      ..highlightedStatus.decoration = BoxDecoration(
          color: const Color.fromRGBO(233, 233, 233, 0.5),
          borderRadius: borderRadius);

    Widget w = TabbedViewTheme(data: themeData, child: tabbedView);

    return Container(padding: const EdgeInsets.all(0), child: w);
  }
}
