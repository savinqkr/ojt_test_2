import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/dropdown_with_label.dart';
import 'package:ojt_test_2/common/widgets/table/table_widget.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/task_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/search_task.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class JobStatusBasicInfo extends StatefulWidget {
  const JobStatusBasicInfo({super.key});

  @override
  State<JobStatusBasicInfo> createState() => _JobStatusBasicInfoState();
}

class _JobStatusBasicInfoState extends State<JobStatusBasicInfo> {
  // onClick
  void onClick() {
    print('ONCLICK');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController taskname = TextEditingController();

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
              TableWidget(
                label: '선행작업목록',
                data: TaskData.selectedTaskDataList,
                columnTitle: const [
                  '번호',
                  '경로',
                  '작업명',
                  '선행 ExecuteJob',
                  '실행결과',
                  '기준일'
                ],
                onClickRemove: (List<int> selectedRows) {
                  setState(() {
                    TaskData().setSelectedRemoveList(selectedRows);
                    TaskData().removeData();
                  });
                  selectedRows.clear();
                },
                dialogTitle: '파라미터',
                dialogContent: const SearchTask(),
                dialogOnPressed: () {
                  setState(() {
                    TaskData().addData();
                  });
                },
              ),
              const SizedBox(height: 24),
              const Text('종료조건'),
              const SizedBox(height: 12),
              const DropDownWithLabel(
                label: '대기시간',
                dropdownOptions: [
                  {'name': '무한대기', 'value': '무한대기'},
                  {'name': '지정일시', 'value': '지정일시'},
                  {'name': '작업시간', 'value': '작업시간'},
                ],
              ),
              const SizedBox(height: 12),
              const CheckBoxWithLabel(label: '실행결과 충종시까지 대시', height: 20),
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
