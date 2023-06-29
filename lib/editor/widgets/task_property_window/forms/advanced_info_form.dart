import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class AdvancedInfoForm extends StatelessWidget {
  const AdvancedInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    // TextEditingController precedingProgram = TextEditingController();
    TextEditingController preferences = TextEditingController();

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
              // TextFieldWithIcon(
              //   dialogTitle: '스케줄',
              //   dialogContent: const Schedule(
              //     columnTitle: ['번호', '타입', '변수명', '범위'],
              //   ),
              //   label: '선행프로그램',
              //   controller: precedingProgram,
              //   // icon: const Icon(Icons.search)),
              //   icon: const Icon(
              //     MaterialSymbols.more_horiz,
              //     size: 24,
              //     color: Palette.black,
              //   ),
              // ),
              const SizedBox(height: 12),
              TextFieldBasic(
                label: '환경설정',
                controller: preferences,
                multiLines: true,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
