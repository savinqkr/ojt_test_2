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
    // -- 캔버스 위에 올린 전체 컴포넌트
    List<ComponentData> allComponentsOnCanvasList =
        canvasReader.model.getAllComponents().values.toList();

    // -- 루트 컴포넌트
    ComponentData rootComponent = getRootComponent(allComponentsOnCanvasList);

    // -- 시작점 & 끝점 컴포넌트 리스트
    List<ComponentData> startPointList = [rootComponent];
    List<List<ComponentData>> endPointList = [];

    // -- while 문 종료 조건 : count = 캔버스 위 전체 컴포넌트 수
    int count = 0;
    int depth = 0;

    while (count < allComponentsOnCanvasList.length) {
      count += startPointList.length;
      // -- startPointList 안의 startPoint 컴포넌트와 연결된 컴포넌트 조회
      for (var startPoint in startPointList) {
        var connectedComponents =
            getEndPointComponents(startPoint, allComponentsOnCanvasList);
        endPointList.add(connectedComponents);
      }

      endPointList = checkOverlappingEndPoints(endPointList);

      if (endPointList.isNotEmpty) {
        // -- 조회한 endpoint 컴포넌트 위치 지정
        for (var endlist in endPointList) {
          List<ComponentData> startPoints = getStartPointComponents(endlist);

          if (startPoints.isNotEmpty) {
            setComponentOffsetHorizontally(startPoints, endlist, depth);
          }
        }

        // -- endPointList 에 있던 컴포넌트들을 startPointList 로 이동
        startPointList.clear();
        for (var endlist in endPointList) {
          for (var endPoint in endlist) {
            startPointList.add(endPoint);
          }
        }
        // endPointList 는 빈배열로 초기화
        endPointList.clear();
      }
      depth++;
    }
  }

  // 수직정렬
  alignComponentsVertically() {
    // -- 캔버스 위에 올린 전체 컴포넌트
    List<ComponentData> allComponentsOnCanvasList =
        canvasReader.model.getAllComponents().values.toList();

    // -- 루트 컴포넌트
    ComponentData rootComponent = getRootComponent(allComponentsOnCanvasList);

    // -- 시작점 & 끝점 컴포넌트 리스트
    List<ComponentData> startPointList = [rootComponent];
    List<List<ComponentData>> endPointList = [];

    // -- while 문 종료 조건 : count = 캔버스 위 전체 컴포넌트 수
    int count = 0;
    int depth = 0;

    while (count < allComponentsOnCanvasList.length) {
      count += startPointList.length;
      // -- startPointList 안의 startPoint 컴포넌트와 연결된 컴포넌트 조회
      for (var startPoint in startPointList) {
        var connectedComponents =
            getEndPointComponents(startPoint, allComponentsOnCanvasList);
        endPointList.add(connectedComponents);
      }

      endPointList = checkOverlappingEndPoints(endPointList);

      if (endPointList.isNotEmpty) {
        // -- 조회한 endpoint 컴포넌트 위치 지정
        for (var endlist in endPointList) {
          List<ComponentData> startPoints = getStartPointComponents(endlist);
          // Offset 설정
          if (startPoints.isNotEmpty) {
            setComponentOffsetVertically(startPoints, endlist, depth);
          }
        }

        // -- endPointList 에 있던 컴포넌트들을 startPointList 로 이동
        startPointList.clear();
        for (var endlist in endPointList) {
          for (var endPoint in endlist) {
            startPointList.add(endPoint);
          }
        }
        // endPointList 는 빈배열로 초기화
        endPointList.clear();
      }
      depth++;
    }
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

  // 시작점 컴포넌트 찾기
  getStartPointComponents(List<ComponentData> endPoints) {
    Map<String, int> countParent = {};
    for (var component in endPoints) {
      for (var connection in component.connections) {
        if (connection is ConnectionIn) {
          if (countParent.keys.contains(connection.otherComponentId)) {
            countParent[connection.otherComponentId] =
                countParent[connection.otherComponentId]! + 1;
          } else {
            countParent[connection.otherComponentId] = 1;
          }
        }
      }
    }

    List<String> keyWithLargestValue = [];
    int largestValue = 0;
    countParent.forEach((key, value) {
      if (value >= largestValue) {
        largestValue = value;
        keyWithLargestValue.add(key);
      }
    });

    List<ComponentData> result = [];
    if (keyWithLargestValue.isNotEmpty) {
      for (var key in keyWithLargestValue) {
        result.add(canvasReader.model.getComponent(key));
      }
    }

    return result;
  }

  // 연결된 하위 컴포넌트들 찾기
  getEndPointComponents(
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

  // 이중배열인 EndPoinList 에 중복되는 요소를 제거하는 메서드
  checkOverlappingEndPoints(List<List<ComponentData>> endpointList) {
    List<List<ComponentData>> output = [];
    for (int i = 0; i < endpointList.length; i++) {
      bool isOverlap = false;
      for (int j = 0; j < output.length; j++) {
        if (compareEndpointArrays(endpointList[i], output[j])) {
          isOverlap = true;
          break;
        }
      }
      if (!isOverlap) {
        output.add(endpointList[i]);
      }
    }

    return output;
  }

  compareEndpointArrays(List<ComponentData> arr1, List<ComponentData> arr2) {
    if (arr1.length != arr2.length) {
      return false;
    }
    for (int i = 0; i < arr1.length; i++) {
      if (arr1[i] != arr2[i]) {
        return false;
      }
    }
    return true;
  }

  // 기준 컴포넌트 기준으로 컴포넌트 수평 정렬
  setComponentOffsetHorizontally(
    List<ComponentData> startPoints,
    List<ComponentData> endPoints,
    int depth,
  ) {
    //  기준 위치
    double criteriaX = 0;
    double criteriaY = 0;
    for (var startPoint in startPoints) {
      criteriaX += startPoint.position.dx;
      criteriaY += startPoint.position.dy;
    }
    criteriaX = criteriaX / startPoints.length;
    criteriaY = criteriaY / startPoints.length;

    // 가중치
    double X = 150;
    double Y = 150;

    // Offset 지정
    for (var component in endPoints) {
      int countEndPointChild = getEndPointComponents(
              component, canvasReader.model.getAllComponents().values.toList())
          .length as int;

      if (countEndPointChild == 0) {
        canvasWriter.model.setComponentPosition(
          component.id,
          Offset(
              criteriaX + X,
              criteriaY +
                  Y *
                      (endPoints.indexOf(component) -
                          (endPoints.length - 1) / 2)),
        );
      } else {
        canvasWriter.model.setComponentPosition(
          component.id,
          Offset(
              criteriaX + X,
              criteriaY +
                  Y *
                      countEndPointChild *
                      (endPoints.indexOf(component) -
                          (endPoints.length - 1) / 2)),
        );
      }
    }
  }

  // 기준 컴포넌트 기준으로 컴포넌트 수직 정렬
  setComponentOffsetVertically(
    List<ComponentData> startPoints,
    List<ComponentData> endPoints,
    int depth,
  ) {
    //  기준 위치
    double criteriaX = 0;
    double criteriaY = 0;
    for (var startPoint in startPoints) {
      criteriaX += startPoint.position.dx;
      criteriaY += startPoint.position.dy;
    }
    criteriaX = criteriaX / startPoints.length;
    criteriaY = criteriaY / startPoints.length;

    // 가중치
    double X = 150;
    double Y = 150;

    // Offset 지정
    for (var component in endPoints) {
      int countEndPointChild = getEndPointComponents(
              component, canvasReader.model.getAllComponents().values.toList())
          .length as int;

      if (countEndPointChild == 0) {
        canvasWriter.model.setComponentPosition(
          component.id,
          Offset(
              criteriaX +
                  X *
                      (endPoints.indexOf(component) -
                          (endPoints.length - 1) / 2),
              criteriaY + Y),
        );
      } else {
        canvasWriter.model.setComponentPosition(
          component.id,
          Offset(
              criteriaX +
                  X *
                      countEndPointChild *
                      (endPoints.indexOf(component) -
                          (endPoints.length - 1) / 2),
              criteriaY + Y),
        );
      }
    }
  }
}
