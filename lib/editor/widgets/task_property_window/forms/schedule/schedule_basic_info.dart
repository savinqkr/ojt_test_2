import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/table/table_widget.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_calendar.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_icon.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/schedule_data.dart';
import 'package:ojt_test_2/editor/models/schedule_time_data.dart';
import 'package:ojt_test_2/editor/models/task_calendar_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/schedule/dialog/schedule.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/schedule/dialog/schedule_time.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/schedule/dialog/task_calendar.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

// ******* String 타입 vs 체크박스 vs .... ETC 에 대한 처리 필요 ******* //

class ScheduleBasicInfo extends StatefulWidget {
  const ScheduleBasicInfo({super.key});

  @override
  State<ScheduleBasicInfo> createState() => _ScheduleBasicInfoState();
}

class _ScheduleBasicInfoState extends State<ScheduleBasicInfo> {
  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController taskname = TextEditingController();
    TextEditingController schedule = TextEditingController();
    TextEditingController startDate = TextEditingController();
    TextEditingController endDate = TextEditingController();

    void onClick() {
      print('taskname : $taskname.text');
      print('schedule : $schedule.text');
      print('startDate : $startDate.text');
      print('endDate : $endDate.text');
    }

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
              const SizedBox(height: 12),
              TextFieldWithIcon(
                label: '스케줄',
                controller: schedule,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
                dialogTitle: '스케줄',
                dialogContent: Schedule(
                  data: ScheduleData.scheduleDataList,
                  columnTitle: const ['번호', '타입', '변수명', '범위'],
                ),
                dialogVar: ScheduleData.selectedDataForAdd,
                dialogOnPressed: () {
                  setState(() {
                    ScheduleData().addData();
                    // schedule.text = ScheduleData
                    //     .scheduleDataList[ScheduleData.selectedDataForAdd!].name
                    //     .toString();
                  });
                },
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldWithCalendar(
                        label: '시작일',
                        controller: startDate,
                        // icon: const Icon(Icons.search)),
                        icon: const Icon(
                          MaterialSymbols.calendar_month,
                          size: 20,
                          color: Palette.black,
                        ),
                      ),
                      const Text('~'),
                      TextFieldWithCalendar(
                        label: '종료일',
                        controller: endDate,
                        // icon: const Icon(Icons.search)),
                        icon: const Icon(
                          MaterialSymbols.calendar_month,
                          size: 20,
                          color: Palette.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CheckBoxWithLabel(label: '작업일기준', height: 32),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TableWidget(
                label: '작업 캘린더',
                data: TaskCalendarData.selectedTaskCalendarDataList,
                columnTitle: const ['번호', '작업캘린더명', '제외'],
                onChangeCheck: (int selectedRow) {
                  setState(() {
                    TaskCalendarData().setException(selectedRow);
                  });
                },
                onClickRemove: (List<int> selectedRows) {
                  setState(() {
                    TaskCalendarData().setSelectedRemoveList(selectedRows);
                    TaskCalendarData().removeData();
                  });
                  selectedRows.clear();
                },
                dialogTitle: '전역설정 작업캘린더',
                dialogContent: TaskCalendar(
                  data: TaskCalendarData.searchedTaskCalendarDataList,
                  columnTitle: const ['번호', '타입', '변수명', '범위'],
                ),
                dialogOnPressed: () {
                  setState(() {
                    TaskCalendarData().addData(['name', 'exception']);
                  });
                },
              ),
              const SizedBox(height: 12),
              TableWidget(
                label: '스케줄시간',
                data: ScheduleTimeData.scheduleTimeDataList,
                columnTitle: const ['번호', '시간'],
                onClickRemove: (List<int> selectedRows) {
                  setState(() {
                    ScheduleTimeData().setSelectedRemove(selectedRows);
                    ScheduleTimeData().removeData();
                  });
                },
                dialogTitle: '스케줄시간',
                dialogContent: const ScheduleTime(
                  columnTitle: ['번호', '작업캘린더명', '제외'],
                ),
                dialogOnPressed: () {
                  setState(() {
                    ScheduleTimeData().addData(['time']);
                  });
                },
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
