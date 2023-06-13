import 'package:get/get.dart';

class EditorDataController extends GetxController {
  String jobName = "";

  void setJobName(selectedJobName) {
    jobName = selectedJobName;
    update();
  }
}
