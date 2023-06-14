import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class ErrorManageForm extends StatelessWidget {
  const ErrorManageForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController retryCount = TextEditingController();
    TextEditingController retryDelay = TextEditingController();

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
              const CheckBoxWithLabel(label: '오류반영', height: 32),
              const SizedBox(height: 24),
              TextFieldBasic(label: '재시도 횟수(회)', controller: retryCount),
              const SizedBox(height: 12),
              TextFieldBasic(label: '재시도 지연시간(초)', controller: retryDelay),
              const SizedBox(height: 24),
              const CheckBoxWithLabel(label: '오류조건', height: 32),
              const SizedBox(height: 12),
              // const TableAddRemove(
              //   tableType: '오류조건',
              //   label: '오류조건',
              //   columnList: [
              //     {'text': '번호', 'width': 50},
              //     {'text': '조건', 'width': 140},
              //     {'text': '재시도', 'width': 50},
              //   ],
              //   data: [],
              //   dialogContent: Text("오류조건"),
              // ),
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
