import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_link_data.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/custom_policy.dart';

mixin MyComponentPolicy implements ComponentPolicy, CustomStatePolicy {
  @override
  onComponentTap(String componentId) {
    if (isMultipleSelectionOn) {
      if (multipleSelected.contains(componentId)) {
        removeComponentFromMultipleSelection(componentId);
        hideComponentHighlight(componentId);
      } else {
        addComponentToMultipleSelection(componentId);
        highlightComponent(componentId);
      }
    } else {
      hideAllHighlights();

      // Add Parent
      if (isReadyToAddParent) {
        isReadyToAddParent = false;
        canvasWriter.model
            .setComponentParent(selectedComponentId!, componentId);
        selectedComponentId = null;
      }

      // Link
      if (isReadyToConnect) {
        isReadyToConnect = false;
        bool connected = connectComponents(selectedComponentId!, componentId);
        if (connected) {
          // print('connected');
          selectedComponentId = null;
        } else {
          // print('not connected');
          selectedComponentId = componentId;
          highlightComponent(componentId);
        }
      } else {
        selectedComponentId = componentId;
        highlightComponent(componentId);
      }
    }
  }

  late Offset lastFocalPoint;

  @override
  onComponentScaleStart(componentId, details) {
    lastFocalPoint = details.localFocalPoint;

    hideLinkOption();
    if (isMultipleSelectionOn) {
      addComponentToMultipleSelection(componentId);
      highlightComponent(componentId);
    }
  }

  @override
  onComponentScaleUpdate(componentId, details) {
    Offset positionDelta = details.localFocalPoint - lastFocalPoint;
    if (isMultipleSelectionOn) {
      for (var compId in multipleSelected) {
        var cmp = canvasReader.model.getComponent(compId);
        canvasWriter.model.moveComponent(compId, positionDelta);
        for (var connection in cmp.connections) {
          if (connection is ConnectionOut &&
              multipleSelected.contains(connection.otherComponentId)) {
            canvasWriter.model.moveAllLinkMiddlePoints(
                connection.connectionId, positionDelta);
          }
        }
      }
    } else {
      lastFocalPoint = details.localFocalPoint;
      canvasWriter.model.moveComponentWithChildren(componentId, positionDelta);

      // ------------- 컴포넌트 이동 시 middle joint 같이 움직이게함 --------------
      // 연결점이 2개인 직선이 아니면 중간 연결점들의 위치를 다시 계산해서 부여함

      var componentData = canvasReader.model.getComponent(componentId);
      for (var connection in componentData.connections) {
        if (canvasReader.model
                .getLink(connection.connectionId)
                .linkPoints
                .length !=
            2) {
          canvasWriter.model
              .moveComponentWithMiddleJoint(connection.connectionId);
        }
      }
      // -----------------------------------------------------------------------
    }
  }

// ----------------------컴포넌트 연결 가능 여부 확인--------------------------
  bool connectComponents(String sourceComponentId, String targetComponentId) {
    // ignore: unnecessary_null_comparison
    if (sourceComponentId == null) {
      return false;
    }
    if (sourceComponentId == targetComponentId) {
      return false;
    }
    if (canvasReader.model.getComponent(sourceComponentId).connections.any(
        (connection) =>
            (connection is ConnectionOut) &&
            (connection.otherComponentId == targetComponentId))) {
      return false;
    }

// 연결 가능 시 connectTwoComponwnts함수를 실행시켜 두 컴포넌트 연결 수행 -> true 반환
    canvasWriter.model.connectTwoComponents(
      sourceComponentId: sourceComponentId,
      targetComponentId: targetComponentId,
      linkStyle: LinkStyle(
        arrowType: ArrowType.pointedArrow,
        lineWidth: 1.0,
        backArrowType: ArrowType.none,
        color: Palette.mint,
      ),
      data: MyLinkData(),
    );

    return true;
  }
}
