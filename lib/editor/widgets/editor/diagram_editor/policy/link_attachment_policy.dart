import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

/// 테두리에 부착, 모양에 따라 다름
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
          pointAlignment = Offset(pointPosition.dx / pointPosition.dx.abs(),
              pointPosition.dy / pointPosition.dx.abs());
        } else {
          pointAlignment = Offset(pointPosition.dx / pointPosition.dy.abs(),
              pointPosition.dy / pointPosition.dy.abs());
        }
        return Alignment(pointAlignment.dx, pointAlignment.dy);

// 수직 정렬이면 component의 상, 하에만 연결, 수평 정렬이면 좌, 우에만 연결
// 현재는 상, 하만 구현
//     Offset pointAlignment;
//     Alignment alignment;

//     switch (policySet.getIsAlignVertically()) {
//       //------------------------------------------------------------------
//       case true:
//         if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
//           pointAlignment =
//               Offset(0.0, pointPosition.dy / pointPosition.dx.abs());
//         } else {
//           pointAlignment =
//               Offset(0.0, pointPosition.dy / pointPosition.dy.abs());
//         }
//         alignment = (pointAlignment.dy == 0.0 || pointAlignment.dy == -0.0)
//             ? const Alignment(0.0, -1.0)
//             : Alignment(pointAlignment.dx, pointAlignment.dy.roundToDouble());
//         return alignment;
// //-------------------------------------------------------------------------
//       case false:
//         if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
//           pointAlignment =
//               Offset(pointPosition.dx / pointPosition.dx.abs(), 0.0);
//         } else {
//           pointAlignment =
//               Offset(pointPosition.dx / pointPosition.dy.abs(), 0.0);
//         }
//         alignment = (pointAlignment.dx == 0.0 || pointAlignment.dx == -0.0)
//             ? const Alignment(-1.0, 0.0)
//             : Alignment(pointAlignment.dx.roundToDouble(), pointAlignment.dy);

//         return alignment;
// // -------------------------------------------------------------------------
//       default:
//         if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
//           pointAlignment =
//               Offset(0.0, pointPosition.dy / pointPosition.dx.abs());
//         } else {
//           pointAlignment =
//               Offset(0.0, pointPosition.dy / pointPosition.dy.abs());
//         }
//         // 0.0, -0.0은 component의 중간에 연결됨. -> -1.0 값 부여
//         alignment = (pointAlignment.dy == 0.0 || pointAlignment.dy == -0.0)
//             ? const Alignment(0.0, -1.0)
//             : Alignment(pointAlignment.dx, pointAlignment.dy.roundToDouble());
//         return alignment;
//     }
    }
  }
}
