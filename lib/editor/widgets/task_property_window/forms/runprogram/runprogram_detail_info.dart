import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_icon.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/agent_file_data.dart';
import 'package:ojt_test_2/editor/models/agent_group_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/agent_select_file.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class RunProgramDetailInfo extends StatefulWidget {
  const RunProgramDetailInfo({super.key});

  @override
  State<RunProgramDetailInfo> createState() => _RunProgramDetailInfoState();
}

class _RunProgramDetailInfoState extends State<RunProgramDetailInfo> {
// onClick
  void onClick() {
    print('ONCLICK');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController waitingTime = TextEditingController();
    TextEditingController maxRuntime = TextEditingController();
    TextEditingController returnSeperator = TextEditingController();
    TextEditingController logfilePath = TextEditingController();
    TextEditingController forcedTerminateCmd = TextEditingController();
    TextEditingController numOfDataProcessFiles = TextEditingController();

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
                label: '선행작업완료후 대기시간(초)',
                controller: waitingTime,
              ),
              const SizedBox(height: 12),
              TextFieldBasic(
                label: '최대실행시간(분)',
                controller: maxRuntime,
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "실행모드",
                    style: GoogleFonts.nanumGothic(
                        fontSize: 12, color: Palette.black),
                  ),
                  const SizedBox(height: 4),
                  const CheckBoxWithLabel(label: '백그라운드 실행', height: 32),
                ],
              ),
              const SizedBox(height: 24),
              TextFieldBasic(
                label: '리턴값 구분자',
                controller: returnSeperator,
              ),
              const SizedBox(height: 24),
              TextFieldWithIcon(
                label: '로그파일 경로',
                controller: logfilePath,
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
              const SizedBox(height: 24),
              TextFieldWithIcon(
                label: '강제종료 명령어',
                controller: forcedTerminateCmd,
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
              TextFieldWithIcon(
                label: '데이터처리건수파일',
                controller: numOfDataProcessFiles,
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
