class GroupData {
  List<Map> groupList = [
    {
      "id": "group1",
      "type": "group",
      "name": "그룹 1",
      "isOpen": true,
      "hasParentGroup": false,
      "groupId": ""
    },
    {
      "id": "group2",
      "type": "group",
      "name": "그룹 2",
      "isOpen": true,
      "hasParentGroup": false,
      "groupId": ""
    },
    {
      "id": "group3",
      "type": "group",
      "name": "그룹 3",
      "isOpen": true,
      "hasParentGroup": false,
      "groupId": ""
    },
    {
      "id": "group4",
      "type": "group",
      "name": "그룹 4",
      "isOpen": false,
      "hasParentGroup": true,
      "groupId": "1"
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

  // 그룹을 추가하는 메서드
  void addGroup() {}
  // 그룹을 삭제하는 메서드
  void removeGroup(String id) {}
// 부모그룹을 찾는 메서드
  void findParentGroup(String id) {}
}
