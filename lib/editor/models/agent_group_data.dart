class AgentGroupData {
  static final List<Map> agentGroupDataList = [
    {
      "groupName": 'Agent_AP1',
    },
    {
      "groupName": 'Agent_AP2',
    },
    {
      "groupName": 'Agent_AP_HA',
    },
    {
      "groupName": 'Agent_AP_LB',
    },
    {
      "groupName": 'Agent_DB',
    },
    {
      "groupName": 'Agent_EM_Master',
    },
    {
      "groupName": 'Agent_Group',
    },
  ];

  static final List<Map> selectedAgentGroupDataList = [];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData() {
    if (selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < agentGroupDataList.length) {
      final selectedDataItem = agentGroupDataList[selectedDataForAdd!];
      selectedAgentGroupDataList.add(selectedDataItem);
    }
  }

  // ======= REMOVE ======= //
  static int? selectedDataForRemove;
  void setSelectedRemove(int selectedRow) {
    selectedDataForRemove = selectedRow;
  }

  void removeData() {
    if (selectedDataForRemove! >= 0 &&
        selectedDataForRemove! < agentGroupDataList.length) {
      final selectedDataItem = agentGroupDataList[selectedDataForRemove!];
      selectedAgentGroupDataList.add(selectedDataItem);
    }
  }
}
