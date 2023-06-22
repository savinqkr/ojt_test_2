import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/editor.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/task_property_window.dart';
import 'package:ojt_test_2/getX/tab_tabs_item_controller.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';
import 'package:ojt_test_2/getX/tree_to_tab_controller.dart';
import 'package:ojt_test_2/getX/viewing_jobId.controller.dart';
import 'package:tabbed_view/tabbed_view.dart';

class TabMenuPage extends StatefulWidget {
  const TabMenuPage({Key? key}) : super(key: key);

  @override
  _TabMenuPageState createState() => _TabMenuPageState();
}

class _TabMenuPageState extends State<TabMenuPage> {
  late TabbedViewController tabController;
  final TabTabsItemController controller = Get.put(TabTabsItemController());

  @override
  void initState() {
    super.initState();

    Get.find<TabTabsItemController>().addItemsToTabsList();

    // controller = TabbedViewController(tabController);

    // TabbedView tabbedView = TabbedView(controller: controller);
  }

// ---------------------- tab style section ----------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          TabbedViewController tabController =
              TabbedViewController(controller.tabs);
          TabbedView tabbedView = TabbedView(
            controller: tabController,
            onTabSelection: (newTabIndex) {
              var jobId =
                  Get.find<TreeToTabController>().jobList[newTabIndex!]['id'];
              Get.find<ViewingJobIdController>().setViewingJobId(jobId);
            },
            onTabClose: (tabIndex, tabData) {
              Get.find<TreeToTabController>().changeJobIsOpen(tabData.text);
            },
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

          return Container(
            padding: const EdgeInsets.all(0),
            child: w,
          );
        },
      ),
    );
  }
}

// --------------------- tab content 속성에 들어갈 부분 ------------------------
class TabMenuContents extends StatelessWidget {
  final String jobId;
  const TabMenuContents({
    super.key,
    required this.jobId,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(TreeToTabController());

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
