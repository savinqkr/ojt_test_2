import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  List<ItemData> itemList = AllTaskList.itemList;
  List<ItemData> filteredList = [];

  bool isSearchActive = false; // 검색 창 활성화 여부

  @override
  void initState() {
    super.initState();
    filteredList.addAll(itemList);
  }

// ---------------- * 검색어 입력 시 검색 결과 반환 함수 *
  void filterSearchResults(String query) {
    List<ItemData> tempItemList = List.from(itemList);
    if (query.isNotEmpty) {
      List<ItemData> tempList = tempItemList.where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        // 검색 결과로 filteredList를 갱신
        filteredList = tempList;
      });
    } else {
      setState(() {
        // 검색어가 없는 경우 filteredList를 초기 아이템 목록으로 설정
        filteredList = itemList;
      });
    }
  }

// -------------------------------- * 구현 section *
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: const BoxDecoration(color: Palette.white),
      height: isSearchActive ? 200 : 60,
      child: Column(
        children: <Widget>[
          // ---------------- * search bar section *
          TextField(
            onSubmitted: (value) {
              _searchController.clear();
              setState(() {
                isSearchActive = false;
              });
            },
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                filterSearchResults(value);
                isSearchActive =
                    value.isNotEmpty; // 검색어 입력 여부에 따라 검색 창 활성화 상태 변경
              });
            },
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontSize: 12),
              labelText: "검색어를 입력하세요.",
              prefixIcon: Icon(Icons.search),
            ),
          ),

          // ---------------- * search list view section *
          // ---------------- 검색창 활성화 여부에 따라서 나타나고 사라짐
          if (isSearchActive)
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
      ),
    );
  }
}
