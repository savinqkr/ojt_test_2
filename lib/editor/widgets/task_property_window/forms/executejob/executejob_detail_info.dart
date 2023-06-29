import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/dropdown_with_label.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class ExecuteJobDetailInfo extends StatelessWidget {
  const ExecuteJobDetailInfo({super.key});
// onClick
  void onClick() {
    print('ONCLICK');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

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
                    "실행모드",
                    style: GoogleFonts.nanumGothic(
                        fontSize: 12, color: Palette.black),
                  ),
                  const SizedBox(height: 4),
                  const CheckBoxWithLabel(label: '백그라운드 실행', height: 20),
                  // const SizedBox(height: 12),
                  const DropDownWithLabel(
                    label: '',
                    isLabelVisible: false,
                    dropdownOptions: [
                      {'name': '대상작업 실행결과 대기', 'value': '대상작업 실행결과 대기'},
                      {
                        'name': '대상작업 실행결과 대기 (결과반영)',
                        'value': '대상작업 실행결과 대기 (결과반영)'
                      },
                      {
                        'name': '대상작업 정상완료 대기 (결과반영)',
                        'value': '대상작업 정상완료 대기 (결과반영)'
                      },
                    ],
                  ),
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
