import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/minimap_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';
import 'package:ojt_test_2/editor/widgets/editor/menu.dart';

class Editor extends StatefulWidget {
  // final bool isPropertyWindowVisible;
  // final Function setIsPropertyWindowVisible;

  // const Editor(
  //     {super.key,
  //     required this.setIsPropertyWindowVisible,
  //     required this.isPropertyWindowVisible});
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
    // return Container(
    //   width: 200,
    //   color: Palette.white,
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text(
    //           "Editor",
    //           style: TextStyle(fontSize: 60),
    //         ),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //         // Text(
    //         //   "OPEN",
    //         //   style: TextStyle(color: Colors.blue, fontSize: 18),
    //         // ),
    //         MouseRegion(
    //           cursor: SystemMouseCursors.click,
    //           child: GestureDetector(
    //             onTap: () {
    //               setIsPropertyWindowVisible();
    //             },
    //             child: Text(
    //               isPropertyWindowVisible ? "CLOSE" : "OPEN",
    //               style: TextStyle(
    //                   color: isPropertyWindowVisible ? Colors.red : Colors.blue,
    //                   fontSize: 18),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // -------------------------------- DIAGRAM EDITOR -------------------------------- //
    return SafeArea(
      child: Stack(
        children: [
          Container(color: Palette.mint.withOpacity(0.15)),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DiagramEditor(
                diagramEditorContext: diagramEditorContext,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                  color: Palette.white,
                  width: 200,
                  height: 32,
                  child: const Text('canvas widgets')),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Row(
              children: [
                Visibility(
                  visible: isMenuVisible,
                  child: Container(
                    color: Colors.grey.withOpacity(0.7),
                    width: 120,
                    height: 320,
                    child: DraggableMenu(myPolicySet: myPolicySet),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMenuVisible = !isMenuVisible;
                      });
                    },
                    child: Container(
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(isMenuVisible ? 'hide menu' : 'show menu'),
                      ),
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
