class ErrorConditionData {
  static final List<Map> errorConditionDataList = [
    {
      "condition": 'ExitCode != 0',
      "retry": true,
    },
    {
      "condition": 'ExitCode == 0',
      "retry": false,
    },
  ];

  static final List<Map> selectedErrorConditionDataList = [
    {
      "condition": 'ExitCode != 0',
      "retry": true,
    },
  ];

  // getAgentGroupFile
  List<dynamic> getAgentGroupFile(String groupName) {
    var result = [];
    for (var element in errorConditionDataList) {
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
    if (selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < errorConditionDataList.length) {
      final selectedDataItem = errorConditionDataList[selectedDataForAdd!];
      selectedErrorConditionDataList.add(selectedDataItem);
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
      if (index >= 0 && index < errorConditionDataList.length) {
        selectedErrorConditionDataList.removeAt(index);
      }
    }
  }
}
