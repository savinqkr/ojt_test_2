import 'package:diagram_editor/diagram_editor.dart';
import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/canvas_option_icon.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/minimap_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/task_menu.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late DiagramEditorContext diagramEditorContext;
  late DiagramEditorContext diagramEditorContextMiniMap;

  MyPolicySet myPolicySet = MyPolicySet();
  MiniMapPolicySet miniMapPolicySet = MiniMapPolicySet();

  bool isMiniMapVisible = true;
  bool isMenuVisible = true;
  bool isOptionsVisible = true;

  @override
  void initState() {
    diagramEditorContext = DiagramEditorContext(
      policySet: myPolicySet,
    );
    diagramEditorContextMiniMap = DiagramEditorContext.withSharedModel(
        diagramEditorContext,
        policySet: miniMapPolicySet);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  DIAGRAM EDITOR  //
    return SafeArea(
      child: Stack(
        children: [
          //  배경색상  //
          Container(color: Palette.white),
          // Container(color: Palette.mint.withOpacity(0.15)),
          //  Diagram Editor  //
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DiagramEditor(
                diagramEditorContext: diagramEditorContext,
              ),
            ),
          ),
          // CANVAS WIDGETS //
          Positioned(
            right: 30,
            bottom: 30,
            child: SizedBox(
              width: 360, // Set a finite width for the ExpandableMenu
              child: ExpandableMenu(
                width: 40.0,
                height: 40.0,
                backgroundColor: Palette.mint.withOpacity(0.7),
                iconColor: Palette.white,
                itemContainerColor: Palette.white,
                items: [
                  CanvasOptionIcon(
                    size: 32,
                    icon: const Icon(Icons.delete_forever,
                        size: 20, color: Palette.darkGrey),
                    tooltip: 'Delete All',
                    onPressed: () => myPolicySet.removeAll(),
                  ),
                  CanvasOptionIcon(
                    size: 32,
                    icon: const Icon(Icons.replay,
                        size: 20, color: Palette.darkGrey),
                    tooltip: 'Reset Editor',
                    onPressed: () => myPolicySet.resetView(),
                  ),
                  CanvasOptionIcon(
                    size: 32,
                    icon: Icon(
                      myPolicySet.isGridVisible
                          ? Icons.grid_off
                          : Icons.grid_on,
                      size: 20,
                      color: Palette.darkGrey,
                    ),
                    tooltip:
                        myPolicySet.isGridVisible ? 'hide grid' : 'show grid',
                    onPressed: () {
                      setState(() {
                        myPolicySet.isGridVisible = !myPolicySet.isGridVisible;
                      });
                      print('isGridVisible : ${myPolicySet.isGridVisible}');
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Visibility(
                      //   visible: myPolicySet.isMultipleSelectionOn,
                      //   child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         CanvasOptionIcon(
                      //           size: 32,
                      //           icon: const Icon(Icons.all_inclusive,
                      //               size: 20, color: Palette.darkGrey),
                      //           tooltip: 'Select All',
                      //           onPressed: () => myPolicySet.selectAll(),
                      //         ),
                      //         CanvasOptionIcon(
                      //           size: 32,
                      //           icon: const Icon(Icons.all_inclusive,
                      //               size: 20, color: Palette.darkGrey),
                      //           tooltip: 'Duplicate Selected',
                      //           onPressed: () =>
                      //               myPolicySet.duplicateSelected(),
                      //         ),
                      //         CanvasOptionIcon(
                      //           size: 32,
                      //           icon: const Icon(Icons.delete,
                      //               size: 20, color: Palette.darkGrey),
                      //           tooltip: 'Remove Selected',
                      //           onPressed: () => myPolicySet.removeSelected(),
                      //         ),
                      //       ]),
                      // ),
                      CanvasOptionIcon(
                        size: 30,
                        icon: Icon(
                            myPolicySet.isMultipleSelectionOn
                                ? Icons.group_work
                                : Icons.group_work_outlined,
                            size: 20,
                            color: Palette.darkGrey),
                        tooltip: myPolicySet.isMultipleSelectionOn
                            ? 'Cancel Multiselection'
                            : 'Enable Multiselection',
                        onPressed: () {
                          setState(() {
                            if (myPolicySet.isMultipleSelectionOn) {
                              myPolicySet.turnOffMultipleSelection();
                            } else {
                              myPolicySet.turnOnMultipleSelection();
                            }
                            print(myPolicySet.isMultipleSelectionOn);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //  Task Menu  //
          Column(
            children: [
              Expanded(
                child: TaskMenu(myPolicySet: myPolicySet),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
