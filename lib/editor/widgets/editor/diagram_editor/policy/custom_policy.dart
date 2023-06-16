import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';

mixin CustomStatePolicy implements PolicySet {
  bool isGridVisible = false; // Grid 설정

  List<String> bodies = [
    'starter',
    'schedule',
    'runProgram',
    'jobStatus',
    'executeJob',
    'and',
    'or',
    'sleep',
    // ---------------------- //
    // 'junction',
    'rect',
    'round_rect',
    'oval',
    'crystal',
    'rhomboid',
    'bean',
    'bean_left',
    'bean_right',
    'document',
    'hexagon_horizontal',
    'hexagon_vertical',
    'bend_left',
    'bend_right',
    'no_corner_rect',
  ];

  String? selectedComponentId;

  bool isMultipleSelectionOn = false;
  List<String> multipleSelected = [];

  Offset deleteLinkPos = Offset.zero;

  bool isReadyToConnect = false;
  bool isReadyToAddParent = false;

  String? selectedLinkId;
  Offset tapLinkPosition = Offset.zero;

  hideAllHighlights() {
    canvasWriter.model.hideAllLinkJoints();
    hideLinkOption();
    canvasReader.model.getAllComponents().values.forEach((component) {
      if (component.data.isHighlightVisible) {
        component.data.hideHighlight();
        canvasWriter.model.updateComponent(component.id);
      }
    });
  }

  highlightComponent(String componentId) {
    canvasReader.model.getComponent(componentId).data.showHighlight();
    canvasReader.model.getComponent(componentId).updateComponent();
  }

  hideComponentHighlight(String componentId) {
    canvasReader.model.getComponent(componentId).data.hideHighlight();
    canvasReader.model.getComponent(componentId).updateComponent();
  }

  turnOnMultipleSelection() {
    isMultipleSelectionOn = true;
    isReadyToConnect = false;

    addComponentToMultipleSelection(selectedComponentId ?? '');
    selectedComponentId = null;
  }

  turnOffMultipleSelection() {
    isMultipleSelectionOn = false;
    multipleSelected = [];
    hideAllHighlights();
  }

  addComponentToMultipleSelection(String? componentId) {
    if (!multipleSelected.contains(componentId!)) {
      multipleSelected.add(componentId);
    }

    if (multipleSelected[0] == '') {
      multipleSelected.remove(multipleSelected[0]);
    }
  }

  removeComponentFromMultipleSelection(String componentId) {
    multipleSelected.remove(componentId);
  }

  String duplicate(ComponentData componentData) {
    var cd = ComponentData(
      type: componentData.type,
      size: componentData.size,
      minSize: componentData.minSize,
      data: MyComponentData.copy(componentData.data),
      position: componentData.position + const Offset(20, 20),
    );
    String id = canvasWriter.model.addComponent(cd);
    return id;
  }

  showLinkOption(String linkId, Offset position) {
    selectedLinkId = linkId;
    tapLinkPosition = position;
  }

  hideLinkOption() {
    selectedLinkId = null;
  }
}

mixin CustomBehaviourPolicy implements PolicySet, CustomStatePolicy {
  removeAll() {
    canvasWriter.model.removeAllComponents();
  }

  resetView() {
    canvasWriter.state.resetCanvasView();
  }

  removeSelected() {
    print(multipleSelected);
    for (var compId in multipleSelected) {
      canvasWriter.model.removeComponent(compId);
    }
    multipleSelected = [];
  }

  duplicateSelected() {
    List<String> duplicated = [];
    for (var componentId in multipleSelected) {
      String newId = duplicate(canvasReader.model.getComponent(componentId));
      duplicated.add(newId);
    }
    hideAllHighlights();
    multipleSelected = [];
    for (var componentId in duplicated) {
      addComponentToMultipleSelection(componentId);
      highlightComponent(componentId);
      canvasWriter.model.moveComponentToTheFront(componentId);
    }
  }

  selectAll() {
    var components = canvasReader.model.canvasModel.components.keys;

    for (var componentId in components) {
      addComponentToMultipleSelection(componentId);
      highlightComponent(componentId);
    }
  }

  alignComponents() {
    print("====================================================");

    var componentList = canvasReader.model.getAllComponents().values.toList();
    for (var component in componentList) {
      var index = componentList.indexOf(component);
      Offset criteria;

      print('$index >>> ');
      print(component.id);
      for (var connection in component.connections) {
        // type == 0 >> StartPoint || type == 1 >> EndPoint
        // print(connection.type);
        // 해당 링크의 아이디
        // print(connection.connectionId);
        // otherComponentId : 이어진 파트너 컴포넌트 아이디
        // print(connection.otherComponentId);
        print(connection.toJson());
      }
      print(component.type);
      print('Before : ${component.position}');

      if (index == 0) {
        canvasWriter.model.moveComponent(
          component.id,
          const Offset(30.0, 30.0),
        );
        criteria = component.position;
      } else {
        canvasWriter.model.moveComponent(
          component.id,
          Offset(30.0 * (componentList.indexOf(component) + 1),
              30.0 * (componentList.indexOf(component) + 1)),
        );
      }

      print('After : ${component.position}');
    }
  }
}
