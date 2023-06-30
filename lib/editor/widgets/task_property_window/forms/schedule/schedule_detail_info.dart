import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_table.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/enums/task.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class ScheduleDetailInfo extends StatefulWidget {
  const ScheduleDetailInfo({super.key});

  @override
  State<ScheduleDetailInfo> createState() => _ScheduleDetailInfoState();
}

class _ScheduleDetailInfoState extends State<ScheduleDetailInfo> {
  void onClick() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                const CheckBoxTable(
                  title: '월',
                  tableHeight: 50 * 3,
                  crossAxisCount: 5,
                  data: [
                    {'height': 20.0, 'label': '1'},
                    {'height': 20.0, 'label': '2'},
                    {'height': 20.0, 'label': '3'},
                    {'height': 20.0, 'label': '4'},
                    {'height': 20.0, 'label': '5'},
                    {'height': 20.0, 'label': '6'},
                    {'height': 20.0, 'label': '7'},
                    {'height': 20.0, 'label': '8'},
                    {'height': 20.0, 'label': '9'},
                    {'height': 20.0, 'label': '10'},
                    {'height': 20.0, 'label': '11'},
                    {'height': 20.0, 'label': '12'},
                  ],
                ),
                const SizedBox(height: 32),
                const CheckBoxTable(
                  title: '요일',
                  tableHeight: 50 * 2,
                  crossAxisCount: 5,
                  data: [
                    {'height': 20.0, 'label': '월'},
                    {'height': 20.0, 'label': '화'},
                    {'height': 20.0, 'label': '수'},
                    {'height': 20.0, 'label': '목'},
                    {'height': 20.0, 'label': '금'},
                    {'height': 20.0, 'label': '토'},
                    {'height': 20.0, 'label': '일'},
                  ],
                ),
                const SizedBox(height: 32),
                const CheckBoxTable(
                  title: '일',
                  tableHeight: 50 * 7,
                  // tableHeight: 48 * 4,
                  crossAxisCount: 5,
                  data: [
                    {'height': 20.0, 'label': '1'},
                    {'height': 20.0, 'label': '2'},
                    {'height': 20.0, 'label': '3'},
                    {'height': 20.0, 'label': '4'},
                    {'height': 20.0, 'label': '5'},
                    {'height': 20.0, 'label': '6'},
                    {'height': 20.0, 'label': '7'},
                    {'height': 20.0, 'label': '8'},
                    {'height': 20.0, 'label': '9'},
                    {'height': 20.0, 'label': '10'},
                    {'height': 20.0, 'label': '11'},
                    {'height': 20.0, 'label': '12'},
                    {'height': 20.0, 'label': '13'},
                    {'height': 20.0, 'label': '14'},
                    {'height': 20.0, 'label': '15'},
                    {'height': 20.0, 'label': '16'},
                    {'height': 20.0, 'label': '17'},
                    {'height': 20.0, 'label': '18'},
                    {'height': 20.0, 'label': '19'},
                    {'height': 20.0, 'label': '20'},
                    {'height': 20.0, 'label': '21'},
                    {'height': 20.0, 'label': '22'},
                    {'height': 20.0, 'label': '23'},
                    {'height': 20.0, 'label': '24'},
                    {'height': 20.0, 'label': '25'},
                    {'height': 20.0, 'label': '26'},
                    {'height': 20.0, 'label': '27'},
                    {'height': 20.0, 'label': '28'},
                    {'height': 20.0, 'label': '29'},
                    {'height': 20.0, 'label': '30'},
                    {'height': 20.0, 'label': '31'},
                    {'height': 20.0, 'label': 'L'},
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
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
      ),
    );
  }
}
