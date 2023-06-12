import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_icon.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class DetailedInfoForm extends StatelessWidget {
  const DetailedInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController waitingTimeAfterPriorWork = TextEditingController();
    TextEditingController maximumRunningTime = TextEditingController();
    TextEditingController returnValueSeparator = TextEditingController();
    TextEditingController logFilePath = TextEditingController();
    TextEditingController shutdownCommand = TextEditingController();
    TextEditingController dataProcessingCountFile = TextEditingController();

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
                  label: '선행작업후 대기시간(초)',
                  controller: waitingTimeAfterPriorWork),
              const SizedBox(height: 12),
              TextFieldBasic(
                  label: '최대 실행시간(분)', controller: maximumRunningTime),
              const SizedBox(height: 24),
              const CheckBoxWithLabel(label: '백그라운드 실행', height: 32),
              const SizedBox(height: 24),
              TextFieldBasic(
                  label: '리턴값 구분자', controller: returnValueSeparator),
              const SizedBox(height: 24),
              TextFieldWithIcon(
                textfieldType: '로그파일경로',
                label: '로그파일경로',
                controller: logFilePath,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
              ),
              const SizedBox(height: 24),
              TextFieldWithIcon(
                textfieldType: '강제종료 명령어',
                label: '강제종료 명령어',
                controller: shutdownCommand,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
              ),
              const SizedBox(height: 12),
              TextFieldWithIcon(
                textfieldType: '데이터처리건수파일',
                label: '데이터처리건수파일',
                controller: dataProcessingCountFile,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
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
