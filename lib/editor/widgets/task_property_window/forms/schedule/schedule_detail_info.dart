import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
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
              Container(
                height: 200,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Palette.mint.withOpacity(0.5))),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(
                          border: BorderDirectional(
                              bottom:
                                  BorderSide(width: 1, color: Palette.grey))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("title"),
                            Row(
                              children: [
                                CheckBoxWithLabel(height: 32, label: '사용여부'),
                                SizedBox(width: 10),
                                CheckBoxWithLabel(height: 32, label: '전체'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: const Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              spacing:
                                  4.0, // Set the spacing between the wrapped elements
                              runSpacing:
                                  4.0, // Set the spacing between the lines
                              children: [
                                CheckBoxWithLabel(height: 20, label: '1'),
                                CheckBoxWithLabel(height: 20, label: '2'),
                                CheckBoxWithLabel(height: 20, label: '3'),
                                CheckBoxWithLabel(height: 20, label: '4'),
                                CheckBoxWithLabel(height: 20, label: '5'),
                                CheckBoxWithLabel(height: 20, label: '6'),
                                // CheckBoxWithLabel(height: 20, label: '7'),
                                // CheckBoxWithLabel(height: 20, label: '8'),
                                // CheckBoxWithLabel(height: 20, label: '9'),
                                // CheckBoxWithLabel(height: 20, label: '10'),
                                // CheckBoxWithLabel(height: 20, label: '11'),
                                // CheckBoxWithLabel(height: 20, label: '12'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // child: const Column(
                      //   children: [
                      //     Padding(
                      //       padding: EdgeInsets.all(4.0),
                      //       child: Row(children: [
                      //         CheckBoxWithLabel(height: 20, label: '1'),
                      //         CheckBoxWithLabel(height: 20, label: '2'),
                      //         CheckBoxWithLabel(height: 20, label: '3'),
                      //         CheckBoxWithLabel(height: 20, label: '4'),
                      //         CheckBoxWithLabel(height: 20, label: '5'),
                      //         CheckBoxWithLabel(height: 20, label: '6'),
                      //       ]),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.all(4.0),
                      //       child: Row(children: [
                      //         CheckBoxWithLabel(height: 20, label: '7'),
                      //         CheckBoxWithLabel(height: 20, label: '8'),
                      //         CheckBoxWithLabel(height: 20, label: '9'),
                      //         CheckBoxWithLabel(height: 20, label: '10'),
                      //         CheckBoxWithLabel(height: 20, label: '11'),
                      //         CheckBoxWithLabel(height: 20, label: '12'),
                      //       ]),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ],
                ),
              )
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
