class DataItem {
  final String type;
  final String name;
  final String range;
  final bool isFavorite;

  DataItem({
    required this.type,
    required this.name,
    required this.range,
    required this.isFavorite,
  });
}

class ScheduleData {
  static final List<DataItem> scheduleDataList = [
    DataItem(
      type: '스케줄',
      name: 'test 1',
      range: '전역',
      isFavorite: false,
    ),
    DataItem(
      type: '스케줄',
      name: 'test 2',
      range: '전역',
      isFavorite: false,
    ),
    DataItem(
      type: '스케줄',
      name: 'test 3',
      range: '전역',
      isFavorite: true,
    ),
    DataItem(
      type: '스케줄',
      name: 'test 4',
      range: '전역',
      isFavorite: true,
    ),
  ];

  static final List<DataItem> selectedScheduleDataList = [];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData() {
    if (selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < scheduleDataList.length) {
      final selectedDataItem = scheduleDataList[selectedDataForAdd!];
      selectedScheduleDataList.add(selectedDataItem);
    }
  }

  // ======= REMOVE ======= //
  static int? selectedDataForRemove;
  void setSelectedRemove(int selectedRow) {
    selectedDataForRemove = selectedRow;
  }

  void removeData() {
    if (selectedDataForRemove! >= 0 &&
        selectedDataForRemove! < scheduleDataList.length) {
      final selectedDataItem = scheduleDataList[selectedDataForRemove!];
      selectedScheduleDataList.add(selectedDataItem);
    }
  }
}
