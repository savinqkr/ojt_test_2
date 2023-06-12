import 'package:get/get.dart';
import 'package:ojt_test_2/enums/task.dart';

class TaskPropertyController extends GetxController {
  bool isPropertyWindowVisible = false;
  String taskId = '???';
  TaskTypes taskType = TaskTypes.none;

  void setIsPropertyWindowVisible(String selectedTaskId) {
    isPropertyWindowVisible = !isPropertyWindowVisible;
    update(); // GetX Controller update
  }

  void setTaskId(String newTaskId) {
    taskId = newTaskId;
    update(); // GetX Controller update
  }

  void setTaskType(TaskTypes newTaskType) {
    taskType = newTaskType;
    update(); // GetX Controller update
  }
}
