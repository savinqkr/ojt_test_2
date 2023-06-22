import 'package:get/get.dart';

class ViewingJobIdController extends GetxController {
  RxString viewingJobId = "job1".obs;

  void setViewingJobId(String selectedJobId) {
    viewingJobId.value = selectedJobId;
    update();
  }
}
