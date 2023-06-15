import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';

mixin MyInitPolicy implements InitPolicy {
  @override
  initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(Colors.white); // Canvas 색상
    canvasWriter.state.setScale(1.0); // 초기 Scale

    //   var cd1 = getSmallComponentData(const Offset(220, 100));
    //   var cd2 = getSmallComponentData(const Offset(220, 180));
    //   var cd3 = getSmallComponentData(const Offset(400, 100));
    //   var cd4 = getSmallComponentData(const Offset(400, 180));

    //   var cd5 = getBigComponentData(const Offset(80, 80));
    //   var cd6 = getBigComponentData(const Offset(380, 80));

    //   // 컴포넌트 생성
    //   canvasWriter.model.addComponent(cd1);
    //   canvasWriter.model.addComponent(cd2);
    //   canvasWriter.model.addComponent(cd3);
    //   canvasWriter.model.addComponent(cd4);
    //   canvasWriter.model.addComponent(cd5);
    //   canvasWriter.model.addComponent(cd6);

    //   // 부모 컴포넌트 앞으로 이동
    //   canvasWriter.model.moveComponentToTheFront(cd5.id);
    //   canvasWriter.model.moveComponentToTheFront(cd6.id);
    //   // 자식 컴포넌트 앞으로 이동
    //   canvasWriter.model.moveComponentToTheFront(cd1.id);
    //   canvasWriter.model.moveComponentToTheFront(cd2.id);
    //   canvasWriter.model.moveComponentToTheFront(cd3.id);
    //   canvasWriter.model.moveComponentToTheFront(cd4.id);

    //   // 부모-자식 relation 걸기
    //   canvasWriter.model.setComponentParent(cd1.id, cd5.id);
    //   canvasWriter.model.setComponentParent(cd2.id, cd5.id);
    //   // 부모-자식 relation 걸기
    //   canvasWriter.model.setComponentParent(cd3.id, cd6.id);
    //   canvasWriter.model.setComponentParent(cd4.id, cd6.id);

    //   // 컴포넌트 사이를 선으로 연결하기
    //   canvasWriter.model.connectTwoComponents(
    //     sourceComponentId: cd1.id,
    //     targetComponentId: cd3.id,
    //     linkStyle: LinkStyle(
    //       lineWidth: 2,
    //       arrowType: ArrowType.arrow,
    //     ),
    //   );
    //   canvasWriter.model.connectTwoComponents(
    //     sourceComponentId: cd4.id,
    //     targetComponentId: cd2.id,
    //     linkStyle: LinkStyle(
    //       lineWidth: 2,
    //       arrowType: ArrowType.arrow,
    //     ),
    //   );
    // }

    // ComponentData getSmallComponentData(Offset position) {
    //   return ComponentData(
    //     size: const Size(80, 64),
    //     minSize: const Size(72, 48),
    //     position: position,
    //     data: MyComponentData(),
    //   );
    // }

    // ComponentData getBigComponentData(Offset position) {
    //   return ComponentData(
    //     size: const Size(240, 180),
    //     minSize: const Size(72, 48),
    //     position: position,
    //     data: MyComponentData(),
    //   );
  }
}
