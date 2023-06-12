import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/advanced_info_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/basic_info_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/description_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/detailed_info_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/error_manage_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/setting_exceptions_form.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class TaskPropertyWindow extends StatelessWidget {
  const TaskPropertyWindow({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(-2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          GetBuilder<TaskPropertyController>(builder: (controller) {
            return DefaultTabController(
              length: getTabBar(controller.taskType).length,
              child: Column(
                children: [
                  TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 10),
                    labelStyle: GoogleFonts.nanumGothic(fontSize: 10),
                    labelColor: Palette.mint,
                    unselectedLabelColor: Colors.grey[400],
                    indicatorColor: Palette.mint,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: getTabBar(controller.taskType)
                        .map((value) => Text(value))
                        .toList(),
                  ),
                  SizedBox(
                    width: 300,
                    height: 880,
                    child: TabBarView(
                      children: getTabBarView(controller.taskType).toList(),
                    ),
                  ),
                ],
              ),
            );
          })
          // DefaultTabController(
          //   length: 2,
          //   child: GetBuilder<TaskPropertyController>(
          //     builder: (controller) {
          //       return Column(
          //         children: [
          //           TabBar(
          //             labelPadding: const EdgeInsets.symmetric(vertical: 10),
          //             labelStyle: GoogleFonts.nanumGothic(fontSize: 10),
          //             labelColor: Palette.mint,
          //             unselectedLabelColor: Colors.grey[400],
          //             indicatorColor: Palette.mint,
          //             indicatorSize: TabBarIndicatorSize.tab,
          //             tabs: getTabBar(controller.taskType)
          //                 .map((value) => Text(value))
          //                 .toList(),
          //           ),
          //           SizedBox(
          //             width: 300,
          //             height: 880,
          //             child: TabBarView(
          //               children: getTabBarView(controller.taskType).toList(),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  List<String> getTabBar(TaskTypes selectedTaskType) {
    switch (selectedTaskType) {
      case TaskTypes.none:
        return [];
      case TaskTypes.starter:
        return ['기본정보', '설명'];
      case TaskTypes.schedule:
        return ['기본정보', '상세정보', '예외설정', '설명'];
      case TaskTypes.runProgram:
        return ['기본정보', '상세정보', '고급정보', '오류관리', '설명'];
      case TaskTypes.executeJob:
        return ['기본정보', '상세정보', '오류관리', '설명'];
      case TaskTypes.jobStatus:
        return ['기본정보', '오류관리', '설명'];
      case TaskTypes.and:
        return ['기본정보', '설명'];
      case TaskTypes.or:
        return ['기본정보', '설명'];
      case TaskTypes.sleep:
        return ['기본정보', '설명'];
      default:
        return [];
    }
  }

  List<Widget> getTabBarView(TaskTypes selectedTaskType) {
    switch (selectedTaskType) {
      case TaskTypes.none:
        return [];
      case TaskTypes.starter:
      case TaskTypes.and:
      case TaskTypes.or:
      case TaskTypes.sleep:
        return [const BasicInfoForm(), const DescriptionForm()];
      case TaskTypes.schedule:
        return [
          const BasicInfoForm(),
          const DetailedInfoForm(),
          const SettingExceptionsForm(),
          const DescriptionForm()
        ];
      case TaskTypes.runProgram:
        return [
          const BasicInfoForm(),
          const DetailedInfoForm(),
          const AdvancedInfoForm(),
          const ErrorManageForm(),
          const DescriptionForm()
        ];
      case TaskTypes.executeJob:
        return [
          const BasicInfoForm(),
          const DetailedInfoForm(),
          const ErrorManageForm(),
          const DescriptionForm()
        ];
      case TaskTypes.jobStatus:
        return [
          const BasicInfoForm(),
          const ErrorManageForm(),
          const DescriptionForm()
        ];
      default:
        return [];
    }
  }
}
