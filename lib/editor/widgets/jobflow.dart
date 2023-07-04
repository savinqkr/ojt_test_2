// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/minimap_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_policy_set.dart';

class JobFlow extends StatefulWidget {
  const JobFlow({super.key});

  @override
  State<JobFlow> createState() => _JobFlowState();
}

class _JobFlowState extends State<JobFlow> {
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

    return SafeArea(
      child: Stack(
        children: [
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
        ],
      ),
    );
  }
}
