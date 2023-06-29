import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:get/get.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/canvas_option_icon.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/minimap_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/task_menu.dart';
import 'package:ojt_test_2/getX/link_state_controller.dart';

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

  bool isCanvasMenuOpen = false;

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
    // diagram_editor LinkAlignController 가져옴 ---> 제거 필요
    myPolicySet.getPutLinkAlignController();

    Get.put(LinkStateController());

    //  DIAGRAM EDITOR  //
    return SafeArea(
      child: Stack(
        children: [
          //  배경색상  //
          Container(color: Palette.white),
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
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Palette.mint.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: isCanvasMenuOpen ? 15 : 10),
              child: Row(children: [
                CanvasOptionIcon(
                  size: 32,
                  icon: const Icon(Icons.close,
                      size: 20, color: Palette.darkGrey),
                  tooltip: 'Close',
                  onPressed: () {
                    setState(() {
                      isCanvasMenuOpen = !isCanvasMenuOpen;
                    });
                  },
                ),
                if (isCanvasMenuOpen)
                  Row(
                    children: [
                      // 저장
                      CanvasOptionIcon(
                        size: 32,
                        icon: const Icon(
                          Icons.save_outlined,
                          size: 20,
                          color: Palette.darkGrey,
                        ),
                        tooltip: 'Save',
                        onPressed: () {
                          print('save');
                        },
                      ),
                      // ---------------------- 뷰 초기화
                      CanvasOptionIcon(
                        size: 32,
                        icon: const Icon(
                          Icons.replay,
                          size: 20,
                          color: Palette.darkGrey,
                        ),
                        tooltip: 'Reset view',
                        onPressed: () => myPolicySet.resetView(),
                      ),
                      // ---------------------- 그리드
                      CanvasOptionIcon(
                        size: 32,
                        icon: Icon(
                          myPolicySet.isGridVisible
                              ? Icons.grid_off
                              : Icons.grid_on,
                          size: 20,
                          color: Palette.darkGrey,
                        ),
                        tooltip: myPolicySet.isGridVisible
                            ? 'Hide grid'
                            : 'Show grid',
                        onPressed: () {
                          setState(() {
                            myPolicySet.isGridVisible =
                                !myPolicySet.isGridVisible;
                          });
                        },
                      ),

                      // ---------------------- 직선
                      CanvasOptionIcon(
                        size: 32,
                        icon: const Icon(MaterialSymbols.straight,
                            size: 20, color: Palette.darkGrey),
                        tooltip: 'Straight Line',
                        onPressed: () {
                          myPolicySet.allStraightLine(
                              Get.find<LinkStateController>()
                                  .isAlignVertically);
                          Get.find<LinkStateController>()
                              .changeIsStraightLine(true);
                        },
                      ),
                      // ---------------------- 꺾은선
                      CanvasOptionIcon(
                        size: 32,
                        icon: const Icon(MaterialSymbols.moving,
                            size: 20, color: Palette.darkGrey),
                        tooltip: 'Broken Line',
                        onPressed: () {
                          myPolicySet.allCurvedLine(
                              Get.find<LinkStateController>()
                                  .isAlignVertically);
                          Get.find<LinkStateController>()
                              .changeIsStraightLine(false);
                        },
                      ),
                      // ---------------------- 곡선
                      CanvasOptionIcon(
                        size: 32,
                        icon: const Icon(MaterialSymbols.airline_stops,
                            size: 20, color: Palette.darkGrey),
                        tooltip: 'Curved Line',
                        onPressed: () {
                          myPolicySet.allCurvedLine(
                              Get.find<LinkStateController>()
                                  .isAlignVertically);
                          Get.find<LinkStateController>()
                              .changeIsStraightLine(false);
                        },
                      ),
                      // ---------------------- 수평정렬
                      CanvasOptionIcon(
                          size: 32,
                          icon: const Icon(Icons.align_vertical_center,
                              size: 20, color: Palette.darkGrey),
                          tooltip: 'Align Horizontally',
                          onPressed: () {
                            myPolicySet.alignComponentsHorizontally(
                                Get.find<LinkStateController>().isStraightLine);

                            Get.find<LinkStateController>()
                                .changeIsAlignHorizontally(false);
                          }),
                      // ---------------------- 수직정렬
                      CanvasOptionIcon(
                        size: 32,
                        icon: const Icon(Icons.align_horizontal_center,
                            size: 20, color: Palette.darkGrey),
                        tooltip: 'Align Vertically',
                        onPressed: () {
                          myPolicySet.alignComponentsVertically(
                              Get.find<LinkStateController>().isStraightLine);

                          Get.find<LinkStateController>()
                              .changeIsAlignHorizontally(true);
                        },
                      ),
                      // ---------------------- 전체 삭제
                      CanvasOptionIcon(
                        size: 32,
                        icon: const Icon(Icons.delete_forever,
                            size: 20, color: Palette.darkGrey),
                        tooltip: 'Delete All',
                        onPressed: () => myPolicySet.removeAll(),
                      ),

                      // ---------------------- 다중 선택
                      CanvasOptionIcon(
                        size: 32,
                        icon: Icon(
                          myPolicySet.isMultipleSelectionOn
                              ? Icons.group_work
                              : Icons.group_work_outlined,
                          size: 20,
                          color: Palette.darkGrey,
                        ),
                        tooltip: myPolicySet.isMultipleSelectionOn
                            ? 'Cancel multiselection'
                            : 'Enable multiselection',
                        onPressed: () {
                          setState(() {
                            if (myPolicySet.isMultipleSelectionOn) {
                              myPolicySet.turnOffMultipleSelection();
                            } else {
                              myPolicySet.turnOnMultipleSelection();
                            }
                          });
                        },
                      ),
                      Visibility(
                        visible: myPolicySet.isMultipleSelectionOn,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Palette.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              // 전체 선택
                              CanvasOptionIcon(
                                size: 32,
                                icon: const Icon(
                                  Icons.all_inclusive,
                                  size: 20,
                                  color: Palette.darkGrey,
                                ),
                                tooltip: 'Select all',
                                onPressed: () => myPolicySet.selectAll(),
                              ),
                              // 선택 복제
                              CanvasOptionIcon(
                                size: 32,
                                icon: const Icon(
                                  Icons.copy,
                                  size: 20,
                                  color: Palette.darkGrey,
                                ),
                                tooltip: 'Duplicate selected',
                                onPressed: () =>
                                    myPolicySet.duplicateSelected(),
                              ),
                              // 선택 삭제
                              CanvasOptionIcon(
                                size: 32,
                                icon: const Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Palette.darkGrey,
                                ),
                                tooltip: 'Remove selected',
                                onPressed: () => myPolicySet.removeSelected(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ]),
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
