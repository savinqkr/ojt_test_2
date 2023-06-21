import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojt_test_2/common/models/task_data.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_link_data.dart';
import 'package:ojt_test_2/getX/viewing_jobId.controller.dart';

mixin MyInitPolicy implements InitPolicy {
  late String viewingJobId;
  @override
  initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(Colors.white); // Canvas 색상
    canvasWriter.state.setScale(1.0); // 초기 Scale

    Get.put(ViewingJobIdController());
    viewingJobId = Get.find<ViewingJobIdController>().viewingJobId;

    var taskList = [];

    if (viewingJobId != '') {
      var tasks = TaskData().getTaskList(viewingJobId);

      tasks.forEach((task) {
        var component = getComponentData(task['position'], task['type']);
        TaskData().setComponentId(task['taskId'], component.id);
        taskList.add({
          'taskId': task['taskId'],
          "componentId": component.id,
          "connections": task['connection'],
        });

        canvasWriter.model.addComponent(component);
      });

      for (var task in taskList) {
        task['connections'].forEach((connection) {
          for (var target in taskList) {
            if (target['taskId'] == connection) {
              canvasWriter.model.connectTwoComponents(
                sourceComponentId: task['componentId'],
                targetComponentId: target['componentId'],
                linkStyle: LinkStyle(
                  arrowType: ArrowType.pointedArrow,
                  lineWidth: 1.5,
                  backArrowType: ArrowType.centerCircle,
                ),
                data: MyLinkData(),
              );
            }
          }
        });
      }

      // var cd2 = getComponentData(const Offset(220, 180), 'schedule');
      // var cd3 = getComponentData(const Offset(400, 100), 'sleep');

      // canvasWriter.model.addComponent(cd2);
      // canvasWriter.model.addComponent(cd3);

      // canvasWriter.model.connectTwoComponents(
      //   sourceComponentId: cd2.id,
      //   targetComponentId: cd3.id,
      //   linkStyle: LinkStyle(
      //     arrowType: ArrowType.pointedArrow,
      //     lineWidth: 1.5,
      //     backArrowType: ArrowType.centerCircle,
      //   ),
      //   data: MyLinkData(),
      // );
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
    }
  }
}

getComponentData(Offset position, String type) {
  return ComponentData(
    type: type,
    position: position,
    data: MyComponentData(),
  );
}
