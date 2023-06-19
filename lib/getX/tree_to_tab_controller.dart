import 'package:get/get.dart';
import 'package:ojt_test_2/common/models/job_data.dart';
import 'package:ojt_test_2/getX/tab_tabs_item_controller.dart';

class TreeToTabController extends GetxController {
  var jobList = JobData().jobList;
  String jobId = "";
  int jobIndex = 0;

// tree에서 선택한 작업의 이름 가져와서
// isOpen이 true면 일단 프린트 (나중에 포커싱으로 변경)
// isOpen이 false면 tabs에 추가
  void getSelectedJobId(String newJobId) {
    for (var item in jobList) {
      if (newJobId == item['name']) {
        if (item['isOpen'] == true) {
          print('open');
        } else if (item['isOpen'] == false) {
          item['isOpen'] = true;
          Get.find<TabTabsItemController>().addItemToTabs(item);
        }
        break;
      }
    }
    update();
  }

// isOpen 상태 변경
  void changeJobIsOpen(closeJobId) {
    for (var item in jobList) {
      if (item['name'] == closeJobId) {
        if (item['isOpen'] == true) {
          item['isOpen'] = false;
        }
      }
    }
    print('change!');
    update();
  }
}

/// 아이디 받아와서 기냐 아니냐랑 false면 true로 바꾸는 것 까지 해놨음
/// 이제 true로 바뀌면 리스트업되고 화면에 그려지게 하면 됨
