import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/table/table_widget.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/setting_exceptions_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/schedule/dialog/setting_exception.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

// ******* String 타입 vs 체크박스 vs .... ETC 에 대한 처리 필요 ******* //

class ScheduleSettingException extends StatefulWidget {
  const ScheduleSettingException({super.key});

  @override
  State<ScheduleSettingException> createState() =>
      _ScheduleSettingExceptionState();
}

class _ScheduleSettingExceptionState extends State<ScheduleSettingException> {
  void onClick() {}

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '* 예외설정에 등록된 일자는 스케줄에 우선 적용됩니다.',
                  style:
                      GoogleFonts.nanumGothic(fontSize: 10, color: Palette.red),
                ),
              ),
              const SizedBox(height: 28),
              TableWidget(
                label: '예외설정',
                data: SettingExceptionsData.settingExeptionsDataList,
                columnTitle: const ['번호', '일자', '포함여부'],
                onClickRemove: (List<int> selectedRows) {
                  setState(() {
                    SettingExceptionsData().setSelectedRemove(selectedRows);
                    SettingExceptionsData().removeData();
                  });
                },
                dialogTitle: '전역설정 작업캘린더',
                dialogContent: const SettingException(),
                dialogOnPressed: () {
                  setState(() {
                    SettingExceptionsData().addData(['name', 'isIncluded']);
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
