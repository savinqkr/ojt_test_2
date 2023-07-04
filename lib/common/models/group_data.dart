class GroupData {
  List<Map> groupList = [
    {
      "id": "group1",
      "type": "group",
      "name": "Group 1",
      'componentId': '',
      "isOpen": true,
      "hasParentGroup": false,
      "parentGroupId": "group3",
      'countChildGroup': 0,
      'jobs': [
        {
          'id': 'job1',
          'type': 'job',
          'name': 'JOB 1',
          'componentId': '',
          'connection': ['job2'],
        },
        {
          'id': 'job1',
          'type': 'job',
          'name': 'JOB 1',
          'componentId': '',
          'connection': [],
        },
      ],
    },
    {
      "id": "group2",
      "type": "group",
      "name": "Group 2",
      'componentId': '',
      "isOpen": true,
      "hasParentGroup": false,
      "parentGroupId": "group3",
      'countChildGroup': 0,
      'jobs': [
        {
          'id': 'job3',
          'type': 'job',
          'name': 'JOB 3',
          'componentId': '',
          'connection': ['job4'],
        },
        {
          'id': 'job4',
          'type': 'job',
          'name': 'JOB 4',
          'componentId': '',
          'connection': ['job5'],
        },
        {
          'id': 'job5',
          'type': 'job',
          'name': 'JOB 5',
          'componentId': '',
          'connection': [],
        },
      ],
    },
    {
      "id": "group3",
      "type": "group",
      "name": "Group 3",
      'componentId': '',
      "isOpen": true,
      "hasParentGroup": false,
      "parentGroupId": "",
      'countChildGroup': 2,
      'jobs': [],
    },
  ];

  // "isOpen" == true 를 만족하는 데이터를 뽑는 메서드
  List<dynamic> getOpenGroupList() {
    var result = [];
    for (var item in groupList) {
      if (item['isOpen'] == true) {
        result.add(item);
      }
    }
    return result;
  }

  List<dynamic> getHasPantGroupList() {
    var result = [];
    for (var item in groupList) {
      if (item['hasParentGroup'] == true) {
        result.add(item);
      }
    }
    return result;
  }

  // 그룹을 추가하는 메서드
  void addGroup() {}
  // 그룹을 삭제하는 메서드
  void removeGroup(String id) {}
  // 부모그룹을 찾는 메서드
  void findParentGroup(String id) {}

  void setGroupComponentId(String groupId, String componentId) {
    for (var group in groupList) {
      if (group['id'] == groupId) {
        group['componentId'] = componentId;
      }
    }
  }
}
