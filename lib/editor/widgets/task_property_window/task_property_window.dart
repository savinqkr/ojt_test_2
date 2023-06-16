import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/and/and_basic_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/common/description.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/executejob/executejob_basic_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/executejob/executejob_detail_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/jobstatus/jobstatus_basic_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/common/error_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/runprogram_advanced_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/runprogram_basic_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/runprogram_detail_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/runprogram_error_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/schedule/schedule_basic_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/schedule/schedule_detail_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/schedule/schedule_setting_exceptions.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/common/basic_info.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/sleep/sleep_basic_info.dart';
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
      case TaskTypes.or:
        return [const BasicInfo(), const DescriptionForm()];
      case TaskTypes.and:
        return [const AndBasicInfo(), const DescriptionForm()];
      case TaskTypes.sleep:
        return [const SleepBasicInfo(), const DescriptionForm()];
      case TaskTypes.schedule:
        return [
          const ScheduleBasicInfo(),
          const ScheduleDetailInfo(),
          const ScheduleSettingException(),
          const DescriptionForm()
        ];
      case TaskTypes.runProgram:
        return [
          const RunProgramBasicInfo(),
          const RunProgramDetailInfo(),
          const RunProgramAdvancedInfo(),
          const RunProgramErrorInfo(),
          const DescriptionForm()
        ];
      case TaskTypes.executeJob:
        return [
          const ExecuteJobBasicInfo(),
          const ExecuteJobDetailInfo(),
          const ErrorInfo(),
          const DescriptionForm()
        ];
      case TaskTypes.jobStatus:
        return [
          const JobStatusBasicInfo(),
          const ErrorInfo(),
          const DescriptionForm()
        ];
      default:
        return [];
    }
  }
}
