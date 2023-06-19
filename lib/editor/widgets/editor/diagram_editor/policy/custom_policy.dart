import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  // ----- 수평정렬 ----- //
  alignComponentsHorizontally() {
    print("수평정렬");

    // List<ComponentData> allComponentsOnCanvasList =
    //     canvasReader.model.getAllComponents().values.toList();

    // List<ComponentData> mainComponents = [
    //   getRootComponent(allComponentsOnCanvasList)
    // ];
    // List<ComponentData> connectedComponents =
    //     getConnectedEndComponents(mainComponents[0], allComponentsOnCanvasList);

    // int count = connectedComponents.length;
    // print(allComponentsOnCanvasList.length);

    // while (count < allComponentsOnCanvasList.length) {
    //   // count += connectedComponents.length;
    //   print(count);

    //   mainComponents = connectedComponents;

    //   var sublist = [];
    //   for (var element in mainComponents) {
    //     print('>>>>> ${element.type}');
    //     getConnectedEndComponents(element, allComponentsOnCanvasList)
    //         .forEach((item) {
    //       sublist.add(item);
    //       print(item.type);
    //     });
    //   }
    //   print('length :  ${sublist.length}');
    //   count += sublist.length;
    //   //   print(sublist.length);
    // }
  }

  // ----- 수직정렬 ----- //
  alignComponentsVertically() {
    print("수직정렬");
    // List<ComponentData> allComponentsOnCanvasList =
    //     canvasReader.model.getAllComponents().values.toList();

    // ComponentData rootComponents = getRootComponent(allComponentsOnCanvasList);

    // List<ComponentData> connectedComponents =
    //     getConnectedEndComponents(rootComponents, allComponentsOnCanvasList);

    // int count = 0;

    // setComponentOffsetVertically(rootComponents, connectedComponents);
    // ComponentData newRootComponent = rootComponents;
    // List<ComponentData> newConnectedComponents = [...connectedComponents];

    // while (count < allComponentsOnCanvasList.length) {
    //   for (var component in newConnectedComponents) {
    //     newRootComponent = component;
    //     newConnectedComponents.clear();
    //     getConnectedEndComponents(newRootComponent, allComponentsOnCanvasList)
    //         .forEach((item) {
    //       newConnectedComponents.add(item);
    //     });
    //     setComponentOffsetVertically(newRootComponent, newConnectedComponents);
    //   }
    //   count += newConnectedComponents.length;
    // }
  }

  // 루트 컴포넌트 찾기
  getRootComponent(List<ComponentData> componentList) {
    ComponentData rootComponent;
    for (var component in componentList) {
      var connectionIn = 0;
      for (var connection in component.connections) {
        if (connection is ConnectionIn) {
          connectionIn++;
        }
        if (connectionIn == 0) {
          rootComponent = component;
          return rootComponent;
        }
      }
    }
  }

  // // 연결된 START 컴포넌트 찾기
  // getConnectedStartComponent(List<ComponentData> componentList) {
  //   String count = '';
  //   String startComponentId = '';
  //   for (var component in componentList) {
  //     print(component.connections);
  //     for (var connection in component.connections) {
  //       print(connection);
  //       if (connection is ConnectionIn &&
  //           connection.otherComponentId == startComponentId) {
  //         startComponentId = connection.otherComponentId;
  //       }
  //     }
  //   }

  //   return startComponentId;
  // }

  // 연결된 END 컴포넌트들 찾기
  getConnectedEndComponents(
      ComponentData mainComponent, List<ComponentData> componentList) {
    List<ComponentData> connectedComponents = [];

    for (var component in componentList) {
      for (var connection in component.connections) {
        if (connection.otherComponentId == mainComponent.id &&
            connection is ConnectionIn) {
          connectedComponents.add(component);
        }
      }
    }

    return connectedComponents;
  }

  // 기준 컴포넌트 기준으로 컴포넌트 수평 정렬
  setComponentOffsetHorizontally(
      ComponentData mainComponent, List<ComponentData> connectedComponents) {
    // print(">>>>>>> ${mainComponent.type} <<<<<<<");
    // print(mainComponent.type);
    // print(mainComponent.position);
    Offset mainPosition = mainComponent.position;
    int X = 200;
    int Y = 100;

    for (var component in connectedComponents) {
      // print("-------- ${component.type} --------");
      // print('BEFORE >> ${component.position}');
      canvasWriter.model.setComponentPosition(
        component.id,
        Offset(
            mainPosition.dx + X,
            mainPosition.dy +
                Y *
                    (connectedComponents.indexOf(component) -
                        (connectedComponents.length - 1) / 2)),
      );
      // print('AFTER >> ${component.position}');
    }
  }

  // 기준 컴포넌트 기준으로 컴포넌트 수직 정렬
  setComponentOffsetVertically(
      ComponentData mainComponent, List<ComponentData> connectedComponents) {
    // print(">>>>>>> ${mainComponent.type} <<<<<<<");
    // print(mainComponent.type);
    // print(mainComponent.position);
    Offset mainPosition = mainComponent.position;
    int X = 200;
    int Y = 150;

    for (var component in connectedComponents) {
      // print("-------- ${component.type} --------");
      // print('BEFORE >> ${component.position}');
      canvasWriter.model.setComponentPosition(
        component.id,
        Offset(
            mainPosition.dx +
                X *
                    (connectedComponents.indexOf(component) -
                        (connectedComponents.length - 1) / 2),
            mainPosition.dy + Y),
      );
      // print('AFTER >> ${component.position}');
    }
  }
}
