class DataItem {
  final String time;

  DataItem({
    required this.time,
  });
}

class ScheduleTimeData {
  static final List<DataItem> scheduleTimeDataList = [];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData() {
    if (selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < scheduleTimeDataList.length) {
      final selectedDataItem = scheduleTimeDataList[selectedDataForAdd!];
      scheduleTimeDataList.add(selectedDataItem);
    }
  }

  // ======= REMOVE ======= //
  static int? selectedDataForRemove;
  void setSelectedRemove(int selectedRow) {
    selectedDataForRemove = selectedRow;
  }

  void removeData() {
    if (selectedDataForRemove! >= 0 &&
        selectedDataForRemove! < scheduleTimeDataList.length) {
      final selectedDataItem = scheduleTimeDataList[selectedDataForRemove!];
      scheduleTimeDataList.remove(selectedDataItem);
    }
  }
}
