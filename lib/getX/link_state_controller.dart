import 'package:get/get.dart';

class LinkStateController extends GetxController {
  bool isAlignVertically = true;
  bool isStraightLine = true;

  void changeIsAlignHorizontally(bool state) {
    isAlignVertically = state;
    update();
  }

  void changeIsStraightLine(bool state) {
    isStraightLine = state;
    update();
  }
}
