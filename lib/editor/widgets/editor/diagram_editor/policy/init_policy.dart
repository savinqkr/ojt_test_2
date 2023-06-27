// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

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
    viewingJobId = window.location.hash.substring(2) == 'editor'
        ? Get.find<ViewingJobIdController>().viewingJobId.value
        : 'jobflow';
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

    // 에디터
    if (jobId != '' && jobId != 'jobflow') {
      var taskList = [];
      var tasks = TaskData().getTaskList(jobId);

      tasks.forEach((task) {
        var component = getTaskData(task['position'], task['type']);
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

    // 잡플로우
    if (jobId == 'jobflow') {
      // JOB
      var jb1 = getJobData(const Offset(120, 200), 'job', "JOB 1");
      var jb2 = getJobData(const Offset(120, 340), 'job', "JOB 2");
      var jb3 = getJobData(const Offset(520, 200), 'job', "JOB 3");
      var jb4 = getJobData(const Offset(520, 340), 'job', "JOB 4");
      var jb5 = getJobData(const Offset(520, 480), 'job', "JOB 5");

      // GROUP
      var gp1 = getGroupData(const Offset(100, 140), 'group', "GROUP 1",
          const Size(280, 300)); // 300
      var gp2 = getGroupData(const Offset(500, 140), 'group', "GROUP 2",
          const Size(280, 440)); // 440
      var gp3 = getGroupData(const Offset(80, 80), 'group', "GROUP 3",
          const Size(720, 540)); // 540

      canvasWriter.model.addComponent(jb1);
      canvasWriter.model.addComponent(jb2);
      canvasWriter.model.addComponent(jb3);
      canvasWriter.model.addComponent(jb4);
      canvasWriter.model.addComponent(jb5);
      canvasWriter.model.addComponent(gp1);
      canvasWriter.model.addComponent(gp2);
      canvasWriter.model.addComponent(gp3);

      canvasWriter.model.moveComponentToTheFront(gp3.id);
      canvasWriter.model.moveComponentToTheFront(gp2.id);
      canvasWriter.model.moveComponentToTheFront(gp1.id);
      canvasWriter.model.moveComponentToTheFront(jb1.id);
      canvasWriter.model.moveComponentToTheFront(jb2.id);
      canvasWriter.model.moveComponentToTheFront(jb3.id);
      canvasWriter.model.moveComponentToTheFront(jb4.id);
      canvasWriter.model.moveComponentToTheFront(jb5.id);

      canvasWriter.model.setComponentParent(gp1.id, gp3.id);
      canvasWriter.model.setComponentParent(gp2.id, gp3.id);
      canvasWriter.model.setComponentParent(jb1.id, gp1.id);
      canvasWriter.model.setComponentParent(jb2.id, gp1.id);
      canvasWriter.model.setComponentParent(jb3.id, gp2.id);
      canvasWriter.model.setComponentParent(jb4.id, gp2.id);
      canvasWriter.model.setComponentParent(jb5.id, gp2.id);

      canvasWriter.model.connectTwoComponents(
        sourceComponentId: jb1.id,
        targetComponentId: jb2.id,
        linkStyle: LinkStyle(
          arrowType: ArrowType.pointedArrow,
          lineWidth: 1.5,
          backArrowType: ArrowType.centerCircle,
        ),
        data: MyLinkData(),
      );
      canvasWriter.model.connectTwoComponents(
        sourceComponentId: jb3.id,
        targetComponentId: jb4.id,
        linkStyle: LinkStyle(
          arrowType: ArrowType.pointedArrow,
          lineWidth: 1.5,
          backArrowType: ArrowType.centerCircle,
        ),
        data: MyLinkData(),
      );
      canvasWriter.model.connectTwoComponents(
        sourceComponentId: jb4.id,
        targetComponentId: jb5.id,
        linkStyle: LinkStyle(
          arrowType: ArrowType.pointedArrow,
          lineWidth: 1.5,
          backArrowType: ArrowType.centerCircle,
        ),
        data: MyLinkData(),
      );
    }
  }
}

getTaskData(Offset position, String type) {
  return ComponentData(
    size: const Size(70, 70),
    type: type,
    position: position,
    data: MyComponentData(),
  );
}

getJobData(Offset position, String type, String name) {
  return ComponentData(
    type: type,
    position: position,
    size: const Size(200, 70),
    data: MyComponentData(
      borderColor: Colors.red,
      text: name,
      textAlignment: Alignment.topLeft,
    ),
  );
}

getGroupData(Offset position, String type, String name, Size size) {
  return ComponentData(
    type: type,
    position: position,
    size: size,
    data: MyComponentData(
      borderColor: Colors.red,
      text: name,
      textAlignment: Alignment.topLeft,
    ),
  );
}
