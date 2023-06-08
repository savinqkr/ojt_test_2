import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

mixin MyInitPolicy implements InitPolicy {
  @override
  initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(Colors.white); // Canvas 색상
    canvasWriter.state.setScale(0.9); // 초기 Scale
  }
}
