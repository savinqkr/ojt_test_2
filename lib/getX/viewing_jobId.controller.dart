import 'package:get/get.dart';

class ViewingJobIdController extends GetxController {
  String viewingJobId = "";

  void setJobName(selectedJobId) {
    viewingJobId = selectedJobId;
    update();
  }
}
