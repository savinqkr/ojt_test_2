import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';

class ScheduleTime extends StatefulWidget {
  final List<String> columnTitle;

  const ScheduleTime({super.key, required this.columnTitle});

  @override
  State<ScheduleTime> createState() => _ScheduleTimeState();
}

class _ScheduleTimeState extends State<ScheduleTime> {
  String selectedOption = '직접입력';

  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController minutes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("등록 방법"),
              DropdownButton<String>(
                value: selectedOption,
                hint: const Text('Select an option'),
                onChanged: (newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: <String>[
                  '직접입력',
                  '범위선택',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (selectedOption == '직접입력')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("스케줄 시간"),
                SizedBox(
                  width: 360,
                  child: Column(
                    children: [
                      TextFieldBasic(
                        label: '',
                        controller: startTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (selectedOption == '범위선택')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("스케줄 범위"),
                SizedBox(
                  width: 360,
                  child: Column(
                    children: [
                      TextFieldBasic(label: '시작시간', controller: startTime),
                      TextFieldBasic(label: '종료시간', controller: endTime),
                      const Text("selector"),
                      TextFieldBasic(label: '분', controller: minutes),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
