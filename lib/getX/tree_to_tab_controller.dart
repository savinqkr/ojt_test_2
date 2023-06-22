import 'package:get/get.dart';
import 'package:ojt_test_2/common/models/job_data.dart';
import 'package:ojt_test_2/getX/tab_tabs_item_controller.dart';

class TreeToTabController extends GetxController {
  var jobList = JobData().jobList.obs;
  String jobId = "";
  int jobIndex = 0;

// tree에서 선택한 작업의 이름 가져와서
// isOpen이 true면 일단 프린트 (나중에 포커싱으로 변경)
// isOpen이 false면 tabs에 추가
  getSelectedJobId(String newJobId) {
    print(newJobId);
    for (var item in jobList) {
      if (newJobId == item['name']) {
        if (item['isOpen'] == true) {
          print('open');
        } else if (item['isOpen'] == false) {
          print('selectedId');
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
    print(jobList);
    update();
  }
}
