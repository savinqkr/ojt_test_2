import 'package:get/get.dart';

class JobFlowController extends GetxController {
  bool isJobFlow = false;

  void setIsJobFlow(bool newValue) {
    isJobFlow = newValue;
    update();
  }
}
