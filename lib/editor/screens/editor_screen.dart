import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/editor/widgets/editor/tab_menu.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/job_tree_page.dart';
import 'package:ojt_test_2/enums/menu.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/common/templates/layout_template.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu.dart';
import 'package:ojt_test_2/getX/tab_tabs_item_controller.dart';
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
  bool isEditorVisible = false;

  void setIsJobTreeVisible() {
    setState(() {
      isJobTreeVisible = !isJobTreeVisible;
    });
  }

  void setIsEditorVisible() {
    setState(() {
      isEditorVisible = !isEditorVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TaskPropertyController());
    Get.put(TabTabsItemController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Text('OJT project',
              style:
                  GoogleFonts.nanumGothic(color: Colors.black, fontSize: 12)),
          centerTitle: true,
          actions: const [
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: Palette.mint,
                ),
                SizedBox(width: 10),
                Text(
                  'User 01',
                  style: TextStyle(color: Palette.mint),
                ),
                SizedBox(width: 30),
              ],
            )
          ],
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
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 5),
              width: 220, // 트리구조 scroll 찾으면 다시 줄일 예정 200
              decoration: BoxDecoration(
                color: Palette.white,
                border: Border(
                  right: BorderSide(
                      color: Palette.mint.withOpacity(0.2), width: 1.5),
                ),
              ),
              child: const MyTreeView(),
              // child: DecoratedBox(
              //   decoration: BoxDecoration(
              //     border: Border(
              //       right: BorderSide(
              //         width: 1.5,
              //         color: Palette.mint.withOpacity(0.2),
              //       ),
              //     ),
              //   ),
              //   child: const MyTreeView(),
            ),
          // ------------------------- JOB Flow Screen -------------------------- //
          // if (!isEditorVisible)
          //   Expanded(
          //     child: Container(
          //       child: Row(children: [
          //         Container(
          //           color: Colors.white,
          //           width: 200,
          //           padding: const EdgeInsets.symmetric(
          //               vertical: 100, horizontal: 20),
          //           child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 const Padding(
          //                   padding: EdgeInsets.symmetric(vertical: 10),
          //                   child: Text('개요'),
          //                 ),
          //                 GestureDetector(
          //                   onTap: () {
          //                     setIsEditorVisible();
          //                   },
          //                   child: const Padding(
          //                     padding: EdgeInsets.symmetric(vertical: 10),
          //                     child: Text('에디터'),
          //                   ),
          //                 ),
          //                 const Padding(
          //                   padding: EdgeInsets.symmetric(vertical: 10),
          //                   child: Text('잡플로우'),
          //                 ),
          //               ]),
          //         ),
          //         Expanded(
          //           child: Container(
          //             color: Colors.blue,
          //           ),
          //         ),
          //       ]),
          //     ),
          //   ),
          // ---------------------------- TAB MENU ------------------------------ //
          if (!isEditorVisible) const Expanded(child: TabMenuPage()),
        ]),
      ),
    );
  }
}
