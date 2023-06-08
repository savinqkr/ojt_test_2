import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/common/models/taskList.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/task_menu/widgets/accordion_form.dart';

// 검색창과 검색 결과 뷰 위젯

class SearchBarWidget extends StatefulWidget {
  final ValueChanged<bool> onFavoriteChanged;
  final bool isFavorite;

// 외부에서 isFavorite를 아이콘 버튼 클릭할 마다 true, false로 변경해 결과를 가져옴
  const SearchBarWidget({
    Key? key,
    required this.isFavorite,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  List<ItemData> itemList = AllTaskList.itemList;

  List<ItemData> filteredList = [];

  bool isSearchActive = false;

  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    filteredList.addAll(itemList);
    _isFavorite = widget.isFavorite;
  }

// -------------- * 검색어 입력 시 검색 결과 반환 함수 * ------------------

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

// -------------------------- * 구현 section * -------------------------------

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: const BoxDecoration(color: Palette.white),
      height: isSearchActive ? 250 : 60,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                // ---------------- * 검색창 * --------------------
                child: TextField(
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
                  enabled: true,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 11),
                    hintText: "검색어를 입력하세요.",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(left: 1),
                      child: Icon(MaterialSymbols.search),
                    ),
                  ),
                ),
              ),

              // ---------------- * 즐겨찾기 버튼 * -------------------
              IconButton(
                color: _isFavorite ? Palette.mint : Palette.yellow,
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                  widget.onFavoriteChanged(_isFavorite); // 값 변경을 콜백으로 전달
                },
                icon: const Icon(
                    Icons.star), // 디자인에 사용했던 아이콘과 이름은 같지만 모양이 달라서 대체함
              ),
            ],
          ),
          // ------------------ * 검색 결과 뷰 * -----------------------
          // ------------------ 검색창 활성화 여부에 따라서 나타나고 사라짐
          if (isSearchActive)
            AccordionForm(
              maxOpenSections: 1,
              headerName: '',
              targetList: filteredList,
              paddingListTop: 5,
              headerPadding: const EdgeInsets.all(0),
            ),
        ],
      ),
    );
  }
}
