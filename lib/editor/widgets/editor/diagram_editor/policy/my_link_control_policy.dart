import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/custom_policy.dart';

// joint 생성 및 업데이트 함수

mixin MyLinkControlPolicy implements LinkPolicy, CustomStatePolicy {
  @override
  onLinkTapUp(String linkId, TapUpDetails details) {
    print('tapUp');
    hideLinkOption();
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);

    showLinkOption(linkId,
        canvasReader.state.fromCanvasCoordinates(details.localPosition));
  }

  var segmentIndex;

  @override
  onLinkScaleStart(String linkId, ScaleStartDetails details) {
    print('scaleStart');
    hideLinkOption();
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
    segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localFocalPoint);
    if (segmentIndex != null) {
      canvasWriter.model
          .insertLinkMiddlePoint(linkId, details.localFocalPoint, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }

// joint를 잡고 움직인 위치 업데이트
  @override
  onLinkScaleUpdate(String linkId, ScaleUpdateDetails details) {
    print('scaleUpdate');
    if (segmentIndex != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
          linkId, details.localFocalPoint, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }

  @override
  createComponentLink(String linkId, Offset position) {
    print('create component link!');
    segmentIndex =
        canvasReader.model.determineLinkSegmentIndex(linkId, position);
    if (segmentIndex != null) {
      canvasWriter.model.insertLinkMiddlePoint(linkId, position, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }

// 링크를 길게 누르면 발생. 링크 옵션을 숨기고 누른 위치에 새로운 중간연결 지점 삽입.
  @override
  onLinkLongPressStart(String linkId, LongPressStartDetails details) {
    print('longPressStart');
    hideLinkOption();
    canvasWriter.model.hideAllLinkJoints();
    canvasWriter.model.showLinkJoints(linkId);
    segmentIndex = canvasReader.model
        .determineLinkSegmentIndex(linkId, details.localPosition);
    if (segmentIndex != null) {
      canvasWriter.model
          .insertLinkMiddlePoint(linkId, details.localPosition, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }

// 링크를 누른 상태에서 이동하는 동안 joint의 위치가 계속 업데이트됨.
  @override
  onLinkLongPressMoveUpdate(String linkId, LongPressMoveUpdateDetails details) {
    print('longPressMoveUpdate');
    if (segmentIndex != null) {
      canvasWriter.model.setLinkMiddlePointPosition(
          linkId, details.localPosition, segmentIndex);
      canvasWriter.model.updateLink(linkId);
    }
  }
}
