import 'package:get/get.dart';

class ViewingJobIdController extends GetxController {
  String viewingJobId = "job1";

  void setViewingJobId(selectedJobId) {
    viewingJobId = selectedJobId;
    update();
  }
}
