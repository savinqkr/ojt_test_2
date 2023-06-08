import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/editor/widgets/editor/editor.dart';
import 'package:ojt_test_2/editor/widgets/task_property_window/task_property_window.dart';
import 'package:ojt_test_2/enums/menu.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/common/templates/layout_template.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu.dart';

class EditorScreen extends StatefulWidget {
  static const String route = '/editor';
  static const MenuTypes menuType = MenuTypes.editor;

  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  bool isJobTreeVisible = true;
  bool isPropertyWindowVisible = true;

  void setIsJobTreeVisible() {
    setState(() {
      isJobTreeVisible = !isJobTreeVisible;
    });
  }

  void setIsPropertyWindowVisible() {
    setState(() {
      isPropertyWindowVisible = !isPropertyWindowVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        contentWidget: Row(
          children: [
            // --------------------------- JOB TREE --------------------------- //
            if (isJobTreeVisible)
              Container(
                width: 200,
                color: Palette.mint.withOpacity(0.7),
              ),
            Expanded(
              child: Column(
                children: [
                  // ------------------------ TABS ----------------------------- //
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 30,
                            color: Colors.red,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 24,
                                  width: 120,
                                  color: Colors.white,
                                  child: const Center(child: Text('TAB')),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 24,
                                  width: 120,
                                  color: Colors.white,
                                  child: const Center(child: Text('TAB')),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 24,
                                  width: 120,
                                  color: Colors.white,
                                  child: const Center(child: Text('TAB')),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: Palette.white,
                      child: Row(
                        children: [
                          // ----------------- TASK MENU ----------------- //
                          // const Column(
                          //   children: [
                          //     Expanded(
                          //       child: TaskMenu(),
                          //     ),
                          //   ],
                          // ),
                          // ----------------- EDITOR ----------------- //
                          const Expanded(child: Editor()),
                          // ----------------- TASK PROPERTY WNIDOW ----------------- //
                          if (isPropertyWindowVisible)
                            const Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: TaskPropertyWindow(),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

            // // --------------------------- TASK MENU --------------------------- //
            // const TaskMenu(),
            // // --------------------------- EDITOR --------------------------- //
            // const Expanded(
            //   child: Editor(),
            // ),
            // // -------------------- TASK PROPERTY WINDOW -------------------- //
            // if (isPropertyWindowVisible)
            //   const SingleChildScrollView(child: TaskPropertyWindow()),
          ],
        ),
      ),
    );
  }
}
