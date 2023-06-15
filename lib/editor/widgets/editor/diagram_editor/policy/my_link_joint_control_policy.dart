import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/custom_policy.dart';

mixin MyLinkJointControlPolicy implements LinkJointPolicy, CustomStatePolicy {
  // 생성된 joint long press 시 joint 제거
  @override
  onLinkJointLongPress(int jointIndex, String linkId) {
    canvasWriter.model.removeLinkMiddlePoint(linkId, jointIndex);
    canvasWriter.model.updateLink(linkId);

    hideLinkOption();
  }

// 이미 생성된 joint를 잡고 움직일 때 position update
  @override
  onLinkJointScaleUpdate(
      int jointIndex, String linkId, ScaleUpdateDetails details) {
    canvasWriter.model.setLinkMiddlePointPosition(
        linkId, details.localFocalPoint, jointIndex);
    canvasWriter.model.updateLink(linkId);

    hideLinkOption();
  }
}
