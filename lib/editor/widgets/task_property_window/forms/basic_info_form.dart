// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/common/widgets/table_with_buttons/table_add_remove.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_calendar.dart';
import 'package:ojt_test_2/common/widgets/textfield_with_icon.dart';
import 'package:ojt_test_2/config/palette.dart';

class BasicInfoForm extends StatelessWidget {
  const BasicInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskname = TextEditingController();
    TextEditingController schedule = TextEditingController();
    TextEditingController startDate = TextEditingController();
    TextEditingController endDate = TextEditingController();

    void onClick() {
      print('taskname : $taskname.text');
      print('schedule : $schedule.text');
      print('startDate : $startDate.text');
      print('endDate : $endDate.text');
    }

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
              Text(
                "TASK NAME",
                style:
                    GoogleFonts.nanumGothic(fontSize: 16, color: Palette.black),
              ),
              const SizedBox(height: 32),
              TextFieldBasic(label: '태스크명', controller: taskname),
              const SizedBox(height: 12),
              TextFieldWithIcon(
                textfieldType: '스케줄',
                label: '스케줄',
                controller: schedule,
                // icon: const Icon(Icons.search)),
                icon: const Icon(
                  MaterialSymbols.more_horiz,
                  size: 24,
                  color: Palette.black,
                ),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldWithCalendar(
                        label: '시작일',
                        controller: startDate,
                        // icon: const Icon(Icons.search)),
                        icon: const Icon(
                          MaterialSymbols.calendar_month,
                          size: 20,
                          color: Palette.black,
                        ),
                      ),
                      const Text('~'),
                      TextFieldWithCalendar(
                        label: '종료일',
                        controller: endDate,
                        // icon: const Icon(Icons.search)),
                        icon: const Icon(
                          MaterialSymbols.calendar_month,
                          size: 20,
                          color: Palette.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CheckBoxWithLabel(label: '작업일기준', height: 32),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const TableAddRemove(
                tableType: '작업캘린더',
                label: '작업캘린더',
                columnList: [
                  {'text': '번호', 'width': 50},
                  {'text': '작업캘린더명', 'width': 140},
                  {'text': '제외', 'width': 50},
                ],
                data: [],
              ),
              const SizedBox(height: 12),
              const TableAddRemove(
                tableType: '스케줄시간',
                label: '스케줄시간',
                columnList: [
                  {'text': '번호', 'width': 60},
                  {'text': '시간', 'width': 180},
                ],
                data: [],
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
