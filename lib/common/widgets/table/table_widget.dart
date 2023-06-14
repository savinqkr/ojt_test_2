import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/table/table_button.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/models/task_calendar_data.dart';

class TableWidget extends StatefulWidget {
  final String label;
  final List<dynamic> data;
  final List<String> columnTitle;
  final Function onClickRemove;
  final String dialogTitle;
  final Widget dialogContent;
  final Function dialogOnPressed;
  final dynamic dialogVar;

  const TableWidget({
    super.key,
    required this.label,
    required this.data,
    required this.columnTitle,
    required this.dialogTitle,
    required this.dialogContent,
    required this.dialogOnPressed,
    this.dialogVar,
    required this.onClickRemove,
  });

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  // onChangeCheck
  void onChangeCheck(bool value, int index) {
    setState(() {
      TaskCalendarData().setException(index);
    });
  }

  // selectedRows
  List<int> selectedRows = [];
  // onRowTap
  void onRowTap(int index) {
    setState(() {
      if (selectedRows.contains(index)) {
        selectedRows.remove(index);
      } else {
        selectedRows.add(index);
      }
    });
  }

  // showDialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.dialogTitle,
              style:
                  GoogleFonts.nanumGothic(fontSize: 20, color: Palette.black)),
          content: widget.dialogContent,
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (widget.dialogVar != null) {
                  widget.dialogOnPressed();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ============== LABEL ============== //
        Text(
          widget.label,
          style: GoogleFonts.nanumGothic(fontSize: 12, color: Palette.black),
        ),
        const SizedBox(height: 6),

        // ============== TABLE ============== //
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
              if (widget.data.isEmpty)
                TableRow(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  children: widget.columnTitle
                      .map((item) => const SizedBox(height: 40))
                      .toList(),
                ),
              if (widget.data.isNotEmpty)
                ...widget.data.map(
                  (item) {
                    final index = widget.data.indexOf(item);
                    final isSelected = selectedRows.contains(index);

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
                        GestureDetector(
                          onTap: () => onRowTap(index),
                          child: Center(
                              child: Text(
                            item.name,
                            style: GoogleFonts.nanumGothic(
                                fontSize: 12, color: Palette.darkGrey),
                          )),
                        ),
                        GestureDetector(
                          onTap: () => onRowTap(index),
                          child: Center(
                            child: Transform.scale(
                              scale: 0.85,
                              child: Checkbox(
                                value: item.exception,
                                onChanged: (value) {
                                  onChangeCheck(value!, index);
                                },
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                    width: 1.0,
                                    color: Palette.mint,
                                  ),
                                ),
                                activeColor: Palette.white,
                                checkColor: Palette.mint,
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
        const SizedBox(height: 10),

        // ============== BUTTONS ============== //
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TableButton(
              label: '추가',
              icon: const Icon(MaterialSymbols.add,
                  size: 12, color: Palette.mint),
              onClick: () {
                _showDialog();
              },
            ),
            const SizedBox(width: 5),
            TableButton(
              label: '제거',
              icon: const Icon(MaterialSymbols.remove,
                  size: 12, color: Palette.mint),
              onClick: () {
                widget.onClickRemove(selectedRows);
                selectedRows.clear();
              },
            ),
          ],
        ),
      ],
    );
  }
}
