class AgentParameterData {
  static final List<Map> agentParameterDataList = [
    {
      "value": 'abc',
    },
  ];

  static final List<Map> selectedAgentParameterDataList = [
    {
      "value": 'abc',
    },
  ];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData() {
    if (selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < agentParameterDataList.length) {
      final selectedDataItem = agentParameterDataList[selectedDataForAdd!];
      selectedAgentParameterDataList.add(selectedDataItem);
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
      if (index >= 0 && index < selectedAgentParameterDataList.length) {
        selectedAgentParameterDataList.removeAt(index);
      }
    }
  }
}
