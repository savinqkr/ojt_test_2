import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/dropdown_with_label.dart';
import 'package:ojt_test_2/common/widgets/table/table_widget.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_icon.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/agent_file_data.dart';
import 'package:ojt_test_2/editor/models/agent_group_data.dart';
import 'package:ojt_test_2/editor/models/agent_parameter_data.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/agent_group.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/agent_parameter.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/runprogram/dialog/agent_select_file.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class RunProgramBasicInfo extends StatefulWidget {
  const RunProgramBasicInfo({super.key});

  @override
  State<RunProgramBasicInfo> createState() => _RunProgramBasicInfoState();
}

class _RunProgramBasicInfoState extends State<RunProgramBasicInfo> {
  // onClick
  void onClick() {
    print('ONCLICK');
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    TextEditingController taskname = TextEditingController();
    TextEditingController agentGroup = TextEditingController();
    TextEditingController taskpath = TextEditingController();
    TextEditingController systemAccount = TextEditingController();

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
                label: '에이전트',
                controller: agentGroup,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
                dialogTitle: '에이전트',
                dialogContent: AgentGroup(
                  data: AgentGroupData.agentGroupDataList,
                  columnTitle: const ['번호', '그룹명'],
                ),
                dialogVar: AgentGroupData.selectedDataForAdd,
                dialogOnPressed: () {
                  setState(() {
                    AgentGroupData.selectedAgentGroupDataList.clear();
                    AgentGroupData().addData();
                    // schedule.text = ScheduleData
                    //     .scheduleDataList[ScheduleData.selectedDataForAdd!].name
                    //     .toString();s
                  });
                  print(AgentGroupData.selectedAgentGroupDataList);
                },
              ),
              const SizedBox(height: 12),
              TextFieldWithIcon(
                label: '실행프로그램',
                controller: agentGroup,
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
                label: '작업경로',
                controller: taskpath,
                required: false,
              ),
              const SizedBox(height: 12),
              const DropDownWithLabel(
                label: '쉘타입',
                isLabelVisible: true,
                dropdownOptions: [
                  {
                    'name': 'Bourne Shell or Window NT',
                    'value': 'BourneWindow'
                  },
                  {'name': 'Korn Shell', 'value': 'Korn'},
                  {'name': 'C Shell', 'value': 'C'},
                ],
              ),
              const SizedBox(height: 12),
              TextFieldBasic(
                label: '시스템계정',
                controller: systemAccount,
                required: false,
              ),
              const SizedBox(height: 12),
              TableWidget(
                label: '파라미터',
                data: AgentParameterData.selectedAgentParameterDataList,
                columnTitle: const ['번호', '값'],
                onClickRemove: (List<int> selectedRows) {
                  setState(() {
                    AgentParameterData().setSelectedRemoveList(selectedRows);
                    AgentParameterData().removeData();
                  });
                  selectedRows.clear();
                },
                dialogTitle: '파라미터',
                dialogContent: const AgentParameter(),
                dialogOnPressed: () {
                  setState(() {
                    AgentParameterData().addData();
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
