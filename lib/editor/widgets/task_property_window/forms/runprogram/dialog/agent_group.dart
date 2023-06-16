import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/agent_group_data.dart';

class AgentGroup extends StatefulWidget {
  final List<dynamic> data;
  final List<String> columnTitle;

  const AgentGroup({
    super.key,
    required this.data,
    required this.columnTitle,
  });

  @override
  State<AgentGroup> createState() => _AgentGroupState();
}

class _AgentGroupState extends State<AgentGroup> {
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
      AgentGroupData().setSelectedAdd(selectedRow);
    });
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("selector"),
              Row(
                children: [
                  Text("searchbar"),
                  SizedBox(width: 10),
                  Text("Icon"),
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
                ...widget.data.map(
                  (item) {
                    final index = widget.data.indexOf(item);
                    final isSelected = selectedRow == index;

                    print(item.values);

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
                              child: Text(
                            '${index + 1}',
                            style: GoogleFonts.nanumGothic(
                                fontSize: 12, color: Palette.darkGrey),
                          )),
                        ),
                        ...item.values.map(
                          (itemValue) => GestureDetector(
                            onTap: () => onRowTap(index),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Center(
                                child: Text(
                                  itemValue,
                                  style: GoogleFonts.nanumGothic(
                                      fontSize: 12, color: Palette.darkGrey),
                                ),
                              ),
                            ),
                          ),
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
