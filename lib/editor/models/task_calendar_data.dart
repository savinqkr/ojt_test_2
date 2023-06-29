class TaskCalendarData {
  static final List<Map> taskCalendarDataList = [
    {
      "type": '작업캘린더',
      "name": '매일',
      "range": '전역',
      "exception": false,
      "isFavorite": false,
    },
    {
      "type": '작업캘린더',
      "name": '휴일',
      "range": '전역',
      "exception": false,
      "isFavorite": false,
    },
    {
      "type": '작업캘린더',
      "name": '영업일',
      "range": '전역',
      "exception": false,
      "isFavorite": true,
    },
    {
      "type": '작업캘린더',
      "name": '매주 화요일',
      "range": '전역',
      "exception": false,
      "isFavorite": false,
    },
  ];

  static final List<Map> selectedTaskCalendarDataList = [
    {
      "name": '매주 화요일',
      "exception": false,
    },
  ];
  static final List<Map> searchedTaskCalendarDataList = [
    ...taskCalendarDataList
  ];

  // ======= ADD ======= //
  static int? selectedDataForAdd;
  void setSelectedAdd(int selectedRow) {
    selectedDataForAdd = selectedRow;
  }

  void addData(List<String> keysToInclude) {
    if (selectedDataForAdd != null &&
        selectedDataForAdd! >= 0 &&
        selectedDataForAdd! < taskCalendarDataList.length) {
      final selectedDataItem = taskCalendarDataList[selectedDataForAdd!];
      final newDataItem = selectedDataItem.entries
          .where((entry) => keysToInclude.contains(entry.key))
          .fold<Map<String, dynamic>>({}, (acc, entry) {
        acc[entry.key] = entry.value;
        return acc;
      });
      selectedTaskCalendarDataList.add(newDataItem);
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
      final updatedDataItem = {
        "name": selectedDataItem['name'],
        "exception": !selectedDataItem['exception'],
      };
      selectedTaskCalendarDataList[index] = updatedDataItem;
    }
  }
}
