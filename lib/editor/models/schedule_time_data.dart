class ScheduleTimeData {
  static final List<Map> scheduleTimeDataList = [
    {'time': '2023/06/14'},
  ];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData(List<String> keysToInclude) {
    if (selectedDataForAdd != null &&
        selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < scheduleTimeDataList.length) {
      final selectedDataItem = scheduleTimeDataList[selectedDataForAdd!];
      final newDataItem = selectedDataItem.entries
          .where((entry) => keysToInclude.contains(entry.key))
          .fold<Map<String, dynamic>>({}, (acc, entry) {
        acc[entry.key] = entry.value;
        return acc;
      });
      scheduleTimeDataList.add(newDataItem);
    }
    print(scheduleTimeDataList);
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
      if (index >= 0 && index < scheduleTimeDataList.length) {
        scheduleTimeDataList.removeAt(index);
      }
    }
  }
}
