import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_icon.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/agent_file_data.dart';
import 'package:ojt_test_2/editor/models/agent_group_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/agent_select_file.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class RunProgramAdvancedInfo extends StatefulWidget {
  const RunProgramAdvancedInfo({super.key});

  @override
  State<RunProgramAdvancedInfo> createState() => _RunProgramAdvancedInfoState();
}

class _RunProgramAdvancedInfoState extends State<RunProgramAdvancedInfo> {
// onClick
  void onClick() {
    print('ONCLICK');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController precedingProgram = TextEditingController();
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
              TextFieldWithIcon(
                label: '선행프로그램',
                controller: precedingProgram,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
                isParentSelected:
                    AgentGroupData.selectedAgentGroupDataList.isNotEmpty,
                dialogTitle: AgentGroupData.selectedAgentGroupDataList.isEmpty
                    ? "파일선택"
                    : '파일선택 - ${AgentGroupData.selectedAgentGroupDataList[0]["groupName"]}',
                dialogContent: AgentSelectFile(
                  data: AgentGroupData.selectedAgentGroupDataList.isNotEmpty
                      ? AgentFileData().getAgentGroupFile(AgentGroupData
                          .selectedAgentGroupDataList[0]['groupName'])
                      : [],
                  columnTitle: const ['번호', '파일명', '크기'],
                ),
                // dialogVar: AgentFileData.selectedDataForAdd,
                dialogOnPressed: () {
                  setState(() {
                    AgentFileData().addData();
                    // schedule.text = ScheduleData
                    //     .scheduleDataList[ScheduleData.selectedDataForAdd!].name
                    //     .toString();
                  });
                },
              ),
              const SizedBox(height: 12),
              TextFieldBasic(
                  label: '환경설정', controller: preferences, multiLines: true),
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
