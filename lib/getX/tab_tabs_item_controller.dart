import 'package:get/get.dart';
import 'package:ojt_test_2/common/models/job_data.dart';
import 'package:ojt_test_2/editor/widgets/editor/tab_menu.dart';
import 'package:tabbed_view/tabbed_view.dart';

class TabTabsItemController extends GetxController {
  List<TabData> tabs = <TabData>[].obs;
  var isOpenJobList = JobData().getOpenJobList().obs;

// tab 초기 렌더링 시 탭 그리는 메서드
  void addItemsToTabsList() {
    for (var job in isOpenJobList) {
      tabs.add(
        TabData(
          text: job['name'],
          keepAlive: true,
          content: TabMenuContents(jobId: job['id']),
        ),
      );
    }
    print(tabs);
    update();
  }

// 클릭한 작업 tabs 리스트에 추가 메서드
  void addItemToTabs(item) {
    tabs.add(
      TabData(
        text: item['name'],
        keepAlive: true,
        content: TabMenuContents(jobId: item['id']),
      ),
    );
    print(tabs);
    update();
  }
}
