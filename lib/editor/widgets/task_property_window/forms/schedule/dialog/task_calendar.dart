import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/dropdown_with_label.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/task_calendar_data.dart';

class TaskCalendar extends StatefulWidget {
  final List<Map> data;
  final List<String> columnTitle;

  const TaskCalendar({
    super.key,
    required this.data,
    required this.columnTitle,
  });

  @override
  State<TaskCalendar> createState() => _TaskCalendarState();
}

class _TaskCalendarState extends State<TaskCalendar> {
  // selectedRows
  int selectedRow = -1;
  // onRowTap
  void onRowTap(int index) {
    setState(() {
      if (selectedRow == index) {
        selectedRow = -1;
      } else {
        selectedRow = index;
      }
      TaskCalendarData().setSelectedAdd(selectedRow);
    });
  }

  // 셀렉터
  String selectorValue = '';
  void selectorValueOnChange(String value) {
    setState(() {
      selectorValue = value;
    });
  }

  // 검색어
  TextEditingController searchValue = TextEditingController();
  List<Map> filteredData = [];
  void filterData(String keyword) {
    String searchKeyword = keyword.toLowerCase();
    bool isFavorite = selectorValue == 'all' ? false : true;

    if (searchKeyword.isEmpty) {
      if (isFavorite == false) {
        filteredData = List.from(widget.data);
      } else {
        filteredData = widget.data.where((item) {
          return item['isFavorite'] == isFavorite;
        }).toList();
      }
    } else {
      if (isFavorite == false) {
        filteredData = widget.data.where((item) {
          return item['name'].toLowerCase().contains(searchKeyword);
        }).toList();
      } else {
        filteredData = widget.data.where((item) {
          return item['name'].toLowerCase().contains(searchKeyword) &&
              item['isFavorite'] == isFavorite;
        }).toList();
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    filteredData = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Decides columnWidths
    final columnWidths = <int, TableColumnWidth>{};
    for (var i = 0; i < widget.columnTitle.length; i++) {
      if (widget.columnTitle[i] == '번호' || widget.columnTitle[i] == '제외') {
        columnWidths[i] = const FixedColumnWidth(50);
      } else {
        columnWidths[i] = const FlexColumnWidth();
      }
    }

    return SizedBox(
      width: 500,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropDownWithLabel(
                label: '',
                width: 100,
                isLabelVisible: false,
                onChangeValue: selectorValueOnChange,
                dropdownOptions: const [
                  {'name': '전체', 'value': 'all'},
                  {'name': '즐겨찾기', 'value': 'favorite'},
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 340,
                    height: 32,
                    child: TextField(
                      controller: searchValue,
                      style: GoogleFonts.nanumGothic(
                          fontSize: 14, color: Palette.black),
                      cursorColor: Palette.mint,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      filterData(searchValue.text);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Palette.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 226, 226, 226),
                            width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: const Center(
                        child: Icon(
                          MaterialSymbols.search,
                          size: 24,
                          color: Palette.darkGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(244, 244, 244, 1),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Table(
              // border: TableBorder.all(),
              columnWidths: columnWidths,
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                // ----------------- COLUMN TITLE ----------------- //
                TableRow(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(244, 244, 244, 1)),
                  children: widget.columnTitle
                      .map(
                        (value) => Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              value,
                              style: GoogleFonts.nanumGothic(
                                  fontSize: 12, color: Palette.darkGrey),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                // ----------------- DATA ----------------- //
                ...filteredData.map(
                  (item) {
                    final index = widget.data.indexOf(item);
                    final isSelected = selectedRow == index;

                    return TableRow(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Palette.mint.withOpacity(0.2)
                            : Colors.white,
                      ),
                      children: [
                        GestureDetector(
                          onTap: () => onRowTap(index),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              '${index + 1}',
                              style: GoogleFonts.nanumGothic(
                                  fontSize: 12, color: Palette.darkGrey),
                            ),
                          )),
                        ),
                        GestureDetector(
                          onTap: () => onRowTap(index),
                          child: Center(
                              child: Text(
                            item['type'],
                            style: GoogleFonts.nanumGothic(
                                fontSize: 12, color: Palette.darkGrey),
                          )),
                        ),
                        GestureDetector(
                          onTap: () => onRowTap(index),
                          child: Center(
                              child: Text(
                            item['name'],
                            style: GoogleFonts.nanumGothic(
                                fontSize: 12, color: Palette.darkGrey),
                          )),
                        ),
                        GestureDetector(
                          onTap: () => onRowTap(index),
                          child: Center(
                              child: Text(
                            item['range'],
                            style: GoogleFonts.nanumGothic(
                                fontSize: 12, color: Palette.darkGrey),
                          )),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
