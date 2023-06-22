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
    Get.put(ViewingJobIdController());

    // Initialize the diagram editor with the default value
    viewingJobId = Get.find<ViewingJobIdController>().viewingJobId.value;
    initializeEditorWithJobId(viewingJobId);

    // Listen to changes in viewingJobId using `ever`
    ever<String>(Get.find<ViewingJobIdController>().viewingJobId, (value) {
      // print('>>>>>>>> $value <<<<<<<');
      canvasWriter.model.removeAllComponents();
      canvasWriter.model.removeAllLinks();
      initializeEditorWithJobId(value);
    });
  }

  void initializeEditorWithJobId(String jobId) {
    canvasWriter.state.setCanvasColor(Colors.white); // Canvas 색상
    canvasWriter.state.setScale(1.0); // 초기 Scale

    if (jobId != '') {
      var taskList = [];
      var tasks = TaskData().getTaskList(jobId);

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
