import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/dropdown_with_label.dart';
import 'package:ojt_test_2/common/widgets/table/table_widget.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/error_condition_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/error_conditions.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class RunProgramErrorInfo extends StatefulWidget {
  const RunProgramErrorInfo({super.key});

  @override
  State<RunProgramErrorInfo> createState() => _RunProgramErrorInfoState();
}

class _RunProgramErrorInfoState extends State<RunProgramErrorInfo> {
// onClick
  void onClick() {
    print('ONCLICK');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController numOfRetry = TextEditingController();
    TextEditingController delayOfRetry = TextEditingController();

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "오류반영",
                    style: GoogleFonts.nanumGothic(
                        fontSize: 12, color: Palette.black),
                  ),
                  const SizedBox(height: 4),
                  const CheckBoxWithLabel(label: '오류발생시 실행결과에 반영', height: 20),
                ],
              ),
              const SizedBox(height: 24),
              TextFieldBasic(
                label: '재시도횟수(회)',
                controller: numOfRetry,
              ),
              const SizedBox(height: 12),
              TextFieldBasic(
                label: '재시도 지연시간(초)',
                controller: delayOfRetry,
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "오류조건",
                    style: GoogleFonts.nanumGothic(
                        fontSize: 12, color: Palette.black),
                  ),
                  const SizedBox(height: 4),
                  const CheckBoxWithLabel(label: '사용함', height: 32),
                ],
              ),
              const SizedBox(height: 12),
              const DropDownWithLabel(
                label: '구분',
                dropdownOptions: [
                  {'name': '오류조건', 'value': '오류조건'},
                  {'name': '정상조건', 'value': '정상조건'},
                ],
              ),
              const SizedBox(height: 12),
              const DropDownWithLabel(
                label: '연산',
                dropdownOptions: [
                  {'name': 'AND', 'value': 'AND'},
                  {'name': 'OR', 'value': 'OR'},
                ],
              ),
              const SizedBox(height: 12),
              TableWidget(
                label: '조건',
                data: ErrorConditionData.selectedErrorConditionDataList,
                columnTitle: const ['번호', '조건', '값'],
                onClickRemove: (List<int> selectedRows) {
                  setState(() {
                    ErrorConditionData().setSelectedRemoveList(selectedRows);
                    ErrorConditionData().removeData();
                  });
                  selectedRows.clear();
                },
                dialogTitle: '파라미터',
                dialogContent: const ErrorConditions(),
                dialogOnPressed: () {
                  setState(() {
                    ErrorConditionData().addData();
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
