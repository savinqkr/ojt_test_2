class AgentFileData {
  static final List<Map> agentFileDataList = [
    {
      "groupName": 'Agent_AP1',
      "fileName": 'store',
      "size": "0 bytes",
    },
    {
      "groupName": 'Agent_AP1',
      "fileName": 'aaa',
      "size": "87 bytes",
    },
    {
      "groupName": 'Agent_AP1',
      "fileName": 'jobagent.jar',
      "size": "2.91MB",
    },
  ];

  static final List<Map> selectedAgentFileDataList = [
    {
      "fileName": 'jobagent.jar',
    },
  ];

  // getAgentGroupFile
  List<dynamic> getAgentGroupFile(String groupName) {
    var result = [];
    for (var element in agentFileDataList) {
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
        selectedDataForAdd! < agentFileDataList.length) {
      final selectedDataItem = agentFileDataList[selectedDataForAdd!];
      selectedAgentFileDataList.add(selectedDataItem);
    }
  }

  // ======= REMOVE ======= //
  static int? selectedDataForRemove;
  void setSelectedRemove(int selectedRow) {
    selectedDataForRemove = selectedRow;
  }

  void removeData() {
    if (selectedDataForRemove! >= 0 &&
        selectedDataForRemove! < agentFileDataList.length) {
      final selectedDataItem = agentFileDataList[selectedDataForRemove!];
      selectedAgentFileDataList.add(selectedDataItem);
    }
  }
}
