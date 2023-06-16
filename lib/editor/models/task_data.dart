class TaskData {
  static final List<Map> taskDataList = [
    {
      "path": '/',
      "taskName": 'TARGET_01',
      "executeJob": "",
      'result': 'OK',
      'baseDate': '오늘',
    },
    {
      "path": '/',
      "taskName": 'TARGET_02',
      "executeJob": "",
      'result': 'OK',
      'baseDate': '오늘',
    },
    {
      "path": '/',
      "taskName": 'TARGET_03',
      "executeJob": "",
      'result': 'OK',
      'baseDate': '오늘',
    },
  ];

  static final List<Map> selectedTaskDataList = [
    {
      "path": '/',
      "taskName": 'TARGET_01',
      "executeJob": "",
      'result': 'OK',
      'baseDate': '오늘',
    },
  ];

  // getAgentGroupFile
  List<dynamic> getAgentGroupFile(String groupName) {
    var result = [];
    for (var element in taskDataList) {
      if (element['groupName'] == groupName) {
        result.add({
          "fileName": element['fileName'],
          "size": element['size'],
        });
      }
    }
    return result;
  }

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData() {
    if (selectedDataForAdd! >= 0 && selectedDataForAdd! < taskDataList.length) {
      final selectedDataItem = taskDataList[selectedDataForAdd!];
      selectedTaskDataList.add(selectedDataItem);
    }
  }

// ======= REMOVE ======= //
  static List<int> selectedDataForRemove = [];
  void setSelectedRemoveList(List<int> selectedRowlist) {
    selectedDataForRemove = selectedRowlist;
  }

  void removeData() {
    // Sort the indexList in descending order to ensure correct removal of elements
    selectedDataForRemove.sort((a, b) => b.compareTo(a));
    // Iterate over the indexList and remove the corresponding elements from taskCalendarDataList
    for (var index in selectedDataForRemove) {
      if (index >= 0 && index < selectedTaskDataList.length) {
        selectedTaskDataList.removeAt(index);
      }
    }
  }
}
