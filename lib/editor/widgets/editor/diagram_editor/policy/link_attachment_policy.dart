import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

/// Attach to border, depends on shape
mixin MyLinkAttachmentPolicy implements LinkAttachmentPolicy {
  @override
  Alignment getLinkEndpointAlignment(
    ComponentData componentData,
    Offset targetPoint,
  ) {
    Offset pointPosition = targetPoint -
        (componentData.position + componentData.size.center(Offset.zero));
    pointPosition = Offset(
      pointPosition.dx / componentData.size.width,
      pointPosition.dy / componentData.size.height,
    );

    // 상대방 컴포넌트의 위치에 따라 컴포넌트의 상하, 좌우의 가운데에만 연결점 생성
    switch (componentData.type) {
      case 'oval':
        Offset pointAlignment = pointPosition / pointPosition.distance;

        return Alignment(pointAlignment.dx, pointAlignment.dy);
      case 'crystal':
        Offset pointAlignment =
            pointPosition / (pointPosition.dx.abs() + pointPosition.dy.abs());

        return Alignment(pointAlignment.dx, pointAlignment.dy);

      default:
        Offset pointAlignment;
        if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
          // 좌우에 생성
          pointAlignment = Offset(
              (pointPosition.dx / pointPosition.dx.abs()).isNaN
                  ? 1.0
                  : pointPosition.dx / pointPosition.dx.abs(),
              0.0);
        } else {
          // 상하에 생성
          pointAlignment = Offset(
              0.0,
              (pointPosition.dy / pointPosition.dy.abs()).isNaN
                  ? 1.0
                  : pointPosition.dy / pointPosition.dy.abs());
        }
        return Alignment(pointAlignment.dx.roundToDouble(),
            pointAlignment.dy.roundToDouble());

// --- 연결된 상대 컴포넌트의 위치에 따라 켬포넌트의 모든 면에 연결점 위치 ---
      // switch (componentData.type) {
      //   case 'oval':
      //     Offset pointAlignment = pointPosition / pointPosition.distance;
      //     return Alignment(pointAlignment.dx, pointAlignment.dy);
      //   case 'crystal':
      //     Offset pointAlignment =
      //         pointPosition / (pointPosition.dx.abs() + pointPosition.dy.abs());
      //     return Alignment(pointAlignment.dx, pointAlignment.dy);
      //   default:
      //     Offset pointAlignment;
      //     if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
      //       pointAlignment = Offset(pointPosition.dx / pointPosition.dx.abs(),
      //           pointPosition.dy / pointPosition.dx.abs());
      //     } else {
      //       pointAlignment = Offset(pointPosition.dx / pointPosition.dy.abs(),
      //           pointPosition.dy / pointPosition.dy.abs());
      //     }
      //     return Alignment(pointAlignment.dx, pointAlignment.dy);
      // }
    }
  }
}
