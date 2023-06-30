import 'package:get/get.dart';

class LinkAlignController extends GetxController {
  bool isAlignVertically = true;

  void changeIsAlignHorizontally(bool state) {
    isAlignVertically = state;
    update();
  }
}
