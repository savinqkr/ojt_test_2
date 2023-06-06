import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/taskList.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  List<ItemData> itemList = AllTaskList.itemList;
  List<ItemData> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList.addAll(itemList);
  }

  // 검색어 입력 시 검색 결과 반환
  void filterSearchResults(String query) {
    List<ItemData> tempItemList = List.from(itemList);
    if (query.isNotEmpty) {
      List<ItemData> tempList = tempItemList.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredList = tempList; // 검색 결과로 filteredList를 갱신
      });
    } else {
      setState(() {
        filteredList = itemList; // 검색어가 없는 경우 filteredList를 초기 아이템 목록으로 설정
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              filterSearchResults(value);
            },
            decoration: const InputDecoration(
              labelText: "검색어를 입력하세요.",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredList[index].name),
              );
            },
          ),
        ),
      ],
    );
  }
}
