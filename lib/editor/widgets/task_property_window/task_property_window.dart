import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/advanced_info_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/basic_info_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/description_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/detailed_info_form.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/forms/error_manage_form.dart';

// https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/

class TaskPropertyWindow extends StatelessWidget {
  const TaskPropertyWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            offset: const Offset(-2, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTabController(
            length: 5,
            child: Column(
              children: [
                TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  labelStyle: GoogleFonts.nanumGothic(fontSize: 10),
                  labelColor: Palette.mint,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorColor: Palette.mint,
                  tabs: const [
                    Tab(text: '기본정보'),
                    Tab(text: '상세정보'),
                    Tab(text: '고급정보'),
                    Tab(text: '오류관리'),
                    Tab(text: '설명'),
                  ],
                ),
                const SingleChildScrollView(
                  child: SizedBox(
                    width: 300,
                    height: 700,
                    child: TabBarView(
                      children: [
                        BasicInfoForm(),
                        DetailedInfoForm(),
                        AdvancedInfoForm(),
                        ErrorManageForm(),
                        DescriptionForm(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
