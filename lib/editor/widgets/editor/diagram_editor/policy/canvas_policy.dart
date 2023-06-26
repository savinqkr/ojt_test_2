import 'package:diagram_editor/diagram_editor.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/custom_policy.dart';

mixin MyCanvasPolicy implements CanvasPolicy, CustomStatePolicy {
  @override
  onCanvasTap() {
    //
    multipleSelected = [];

    if (isReadyToConnect) {
      isReadyToConnect = false;
      canvasWriter.model.updateComponent(selectedComponentId!);
    } else {
      selectedComponentId = null;
      hideAllHighlights();
    }

    if (isReadyToAddParent) {
      isReadyToAddParent = false;
      canvasWriter.model.updateComponent(selectedComponentId!);
    } else {
      selectedComponentId = null;
      hideAllHighlights();
    }
  }
}
