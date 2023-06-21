class JobData {
  List<Map> jobList = [
    {
      "id": "job1",
      "type": "job",
      "name": "Sample 1",
      "groupId": "group1",
      "isOpen": true
    },
    {
      "id": "job2",
      "type": "job",
      "name": "Sample 2",
      "groupId": "group2",
      "isOpen": true
    },
    {
      "id": "job3",
      "type": "job",
      "name": "Sample 3",
      "groupId": "group3",
      "isOpen": false
    },
    {
      "id": "job4",
      "type": "job",
      "name": "Sample 4",
      "groupId": "group4",
      "isOpen": false
    },
  ];

  // "isOpen" == true 를 만족하는 데이터를 뽑는 메서드
  List<dynamic> getOpenJobList() {
    var result = [];
    for (var item in jobList) {
      if (item['isOpen'] == true) {
        result.add(item);
      }
    }
    return result;
  }

  // 부모 group을 찾는 메서드
  List<dynamic> findParentGroup(String parentGroupId) {
    var result = [];
    for (var item in jobList) {
      if (item['groupId'] == parentGroupId) {
        result.add(item);
      }
    }
    return result;
  }

  // JOB을 추가하는 메서드
  void addJob(int count, String groupId) {
    Map<String, dynamic> newItem = Map<String, dynamic>.from({
      "id": "job$count",
      "type": "job",
      "name": "Sample $count",
      "groupId": groupId,
      "isOpen": false
    });

    jobList.add(newItem);
    getOpenJobList();
    print(jobList);
  }

  // JOB을 삭제하는 메서드
  void removeGroup(String id) {}
}
