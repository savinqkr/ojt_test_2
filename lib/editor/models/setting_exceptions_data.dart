class SettingExceptionsData {
  static final List<Map> allSettingExeptionsDataList = [
    {
      'name': '2023/06/10',
      'isIncluded': true,
      'isEveryYear': false,
    }
  ];
  static final List<Map> settingExeptionsDataList = [
    {
      'name': '2023/06/10',
      'isIncluded': true,
    }
  ];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData(List<String> keysToInclude) {
    if (selectedDataForAdd != null &&
        selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < settingExeptionsDataList.length) {
      final selectedDataItem = settingExeptionsDataList[selectedDataForAdd!];
      final newDataItem = selectedDataItem.entries
          .where((entry) => keysToInclude.contains(entry.key))
          .fold<Map<String, dynamic>>({}, (acc, entry) {
        acc[entry.key] = entry.value;
        return acc;
      });
      settingExeptionsDataList.add(newDataItem);
    }
    print(settingExeptionsDataList);
  }

  // ======= REMOVE ======= //
  static List<int> selectedDataForRemove = [];
  void setSelectedRemove(List<int> selectedRowList) {
    selectedDataForRemove = selectedRowList;
  }

  void removeData() {
    // Sort the indexList in descending order to ensure correct removal of elements
    selectedDataForRemove.sort((a, b) => b.compareTo(a));
    // Iterate over the indexList and remove the corresponding elements from taskCalendarDataList
    for (var index in selectedDataForRemove) {
      if (index >= 0 && index < settingExeptionsDataList.length) {
        settingExeptionsDataList.removeAt(index);
      }
    }
  }

  // ======= SET ISINCLUDED ======= //
  void setIsIncluded(int index, bool value) {
    if (index >= 0 && index < settingExeptionsDataList.length) {
      final selectedDataItem = settingExeptionsDataList[index];
      final updatedDataItem = {
        "name": selectedDataItem['name'],
        "isIncluded": !selectedDataItem['isIncluded'],
        "isEveryYear": selectedDataItem['isEveryYear'],
      };
      settingExeptionsDataList[index] = updatedDataItem;
    }
  }

  // ======= SET ISEVERYYEAR ======= //
  void setIsEveryYear(int index) {
    if (index >= 0 && index < settingExeptionsDataList.length) {
      final selectedDataItem = settingExeptionsDataList[index];
      final updatedDataItem = {
        "name": selectedDataItem['name'],
        "isIncluded": selectedDataItem['isIncluded'],
        "isEveryYear": !selectedDataItem['isEveryYear'],
      };
      settingExeptionsDataList[index] = updatedDataItem;
    }
  }
}
