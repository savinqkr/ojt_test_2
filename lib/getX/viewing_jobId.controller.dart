import 'package:get/get.dart';

class ViewingJobIdController extends GetxController {
  String viewingJobId = "job1";
  // String viewingJobId = "job2";

  void setViewingJobId(selectedJobId) {
    viewingJobId = selectedJobId;
    update();
  }
}
