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
    //       pointAlignment =
    //           Offset(0.0, pointPosition.dy / pointPosition.dx.abs());
    //     } else {
    //       pointAlignment =
    //           Offset(0.0, pointPosition.dy / pointPosition.dy.abs());
    //     }
    //     return Alignment(pointAlignment.dx, pointAlignment.dy.roundToDouble());
    // }

    Offset pointAlignment;
    if (pointPosition.dx.abs() >= pointPosition.dy.abs()) {
      pointAlignment = Offset(0.0, pointPosition.dy / pointPosition.dx.abs());
    } else {
      pointAlignment = Offset(0.0, pointPosition.dy / pointPosition.dy.abs());
    }
    return Alignment(pointAlignment.dx, pointAlignment.dy.roundToDouble());
  }
}
