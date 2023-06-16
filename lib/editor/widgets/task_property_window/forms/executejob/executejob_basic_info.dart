import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/dropdown_with_label.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_icon.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/task_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/search_task.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class ExecuteJobBasicInfo extends StatefulWidget {
  const ExecuteJobBasicInfo({super.key});

  @override
  State<ExecuteJobBasicInfo> createState() => _ExecuteJobBasicInfoState();
}

class _ExecuteJobBasicInfoState extends State<ExecuteJobBasicInfo> {
  // onClick
  void onClick() {
    print('ONCLICK');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController taskname = TextEditingController();
    TextEditingController followUpTask = TextEditingController();
    TextEditingController displayName = TextEditingController();
    TextEditingController startDate_1 = TextEditingController();
    TextEditingController startDate_2 = TextEditingController();

    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Palette.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<TaskPropertyController>(
                builder: (controller) {
                  return Text(
                    convertEnumToString(controller.taskType),
                    style: GoogleFonts.nanumGothic(
                        fontSize: 16, color: Palette.black),
                  );
                },
              ),
              const SizedBox(height: 32),
              TextFieldBasic(
                label: '태스크명',
                controller: taskname,
                required: true,
              ),
              const SizedBox(height: 24),
              TextFieldWithIcon(
                label: '후행작업',
                controller: followUpTask,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
                dialogTitle: '작업조회',
                dialogContent: const SearchTask(),
                dialogVar: TaskData.selectedDataForAdd,
                dialogOnPressed: () {
                  setState(() {
                    TaskData.selectedTaskDataList.clear();
                    TaskData().addData();
                    // schedule.text = ScheduleData
                    //     .scheduleDataList[ScheduleData.selectedDataForAdd!].name
                    //     .toString();s
                  });
                  print(TaskData.selectedTaskDataList);
                },
              ),
              const SizedBox(height: 12),
              TextFieldBasic(
                label: '표시명',
                controller: displayName,
              ),
              const SizedBox(height: 12),
              TextFieldBasic(
                label: '시작일시',
                controller: startDate_1,
              ),
              TextFieldBasic(
                label: '',
                controller: startDate_2,
              ),
              const SizedBox(height: 12),
              const DropDownWithLabel(
                label: '',
                dropdownOptions: [
                  {'name': '혀용', 'value': '혀용'},
                  {'name': '불가', 'value': '불가'},
                  {'name': '순차', 'value': '순차'},
                  {'name': '스킵', 'value': '스킵'},
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                width: 80,
                height: 24,
                text: '저장',
                textColor: Palette.white,
                textSize: 12,
                buttonColor: Palette.mint.withOpacity(0.75),
                onClick: onClick,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
