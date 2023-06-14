class DataItem {
  final String type;
  final String name;
  final String range;
  final bool exception;
  final bool isFavorite;

  DataItem({
    required this.type,
    required this.name,
    required this.range,
    required this.exception,
    required this.isFavorite,
  });
}

class TaskCalendarData {
  static final List<DataItem> taskCalendarDataList = [
    DataItem(
      type: '작업캘린더',
      name: '매일',
      range: '전역',
      exception: false,
      isFavorite: false,
    ),
    DataItem(
      type: '작업캘린더',
      name: '휴일',
      range: '전역',
      exception: false,
      isFavorite: false,
    ),
    DataItem(
      type: '작업캘린더',
      name: '영업일',
      range: '전역',
      exception: false,
      isFavorite: true,
    ),
    DataItem(
      type: '작업캘린더',
      name: '매주 금요일',
      range: '전역',
      exception: false,
      isFavorite: true,
    ),
  ];

  static final List<DataItem> selectedTaskCalendarDataList = [];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData() {
    if (selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < taskCalendarDataList.length) {
      final selectedDataItem = taskCalendarDataList[selectedDataForAdd!];
      selectedTaskCalendarDataList.add(selectedDataItem);
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
      if (index >= 0 && index < selectedTaskCalendarDataList.length) {
        selectedTaskCalendarDataList.removeAt(index);
      }
    }
  }

  // ======= SET EXCEPTION ======= //
  void setException(int index) {
    if (index >= 0 && index < selectedTaskCalendarDataList.length) {
      final selectedDataItem = selectedTaskCalendarDataList[index];
      final updatedDataItem = DataItem(
        type: selectedDataItem.type,
        name: selectedDataItem.name,
        range: selectedDataItem.range,
        exception: !selectedDataItem.exception,
        isFavorite: selectedDataItem.isFavorite,
      );
      selectedTaskCalendarDataList[index] = updatedDataItem;
    }
  }
}
