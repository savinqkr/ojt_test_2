import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/editor/widgets/editor/tab_menu.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/job_tree_page.dart';
import 'package:ojt_test_2/enums/menu.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/common/templates/layout_template.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu.dart';
import 'package:ojt_test_2/getX/task_propterty_controller.dart';

class EditorScreen extends StatefulWidget {
  static const String route = '/editor';
  static const MenuTypes menuType = MenuTypes.editor;

  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  bool isJobTreeVisible = true;

  void setIsJobTreeVisible() {
    setState(() {
      isJobTreeVisible = !isJobTreeVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Text('OJT Project',
              style:
                  GoogleFonts.nanumGothic(color: Colors.black, fontSize: 12)),
          centerTitle: true,
        ),
      ),
      body: LayoutTemplate(
        menuWidget: SidebarMenu(
          currentMenu: EditorScreen.menuType,
          setIsJobTreeVisible: setIsJobTreeVisible,
        ),
        contentWidget: Row(children: [
          // --------------------------- JOB TREE --------------------------- //
          if (isJobTreeVisible)
            Container(
              width: 200,
              color: Palette.white,
              child: const MyTreeView(),
            ),
          // ---------------------------- TAB MENU ------------------------------ //
          const Expanded(child: TabMenuPage()),
        ]),
        // Expanded(
        //   child: Container(
        //     color: Palette.white,
        //     child: Row(
        //       children: [
        //         // ----------------- TASK MENU ----------------- //
        //         // const Column(
        //         //   children: [
        //         //     Expanded(
        //         //       child: TaskMenu(),
        //         //     ),
        //         //   ],
        //         // ),
        //         // ----------------- EDITOR ----------------- //
        //         const Expanded(child: Editor()),
        //         // ----------------- TASK PROPERTY WINDOW ----------------- //
        //         GetBuilder<TaskPropertyController>(
        //           builder: (controller) {
        //             if (controller.isPropertyWindowVisible) {
        //               return const Column(
        //                 children: [
        //                   Expanded(
        //                     child: SingleChildScrollView(
        //                       child: TaskPropertyWindow(),
        //                     ),
        //                   ),
        //                 ],
        //               );
        //             } else {
        //               return Container();
        //             }
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
