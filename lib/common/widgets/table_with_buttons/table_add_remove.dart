import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/table_with_buttons/table_button.dart';
import 'package:ojt_test_2/config/palette.dart';

class TableAddRemove extends StatefulWidget {
  final String tableType;
  final String label;
  final Widget dialogContent;
  final List<dynamic> columnList;
  final List<dynamic> data;

  const TableAddRemove({
    super.key,
    required this.label,
    required this.columnList,
    required this.data,
    required this.tableType,
    required this.dialogContent,
  });

  @override
  State<TableAddRemove> createState() => _TableAddRemoveState();
}

class _TableAddRemoveState extends State<TableAddRemove> {
  List<String> items = [];

  void addItem() {
    setState(() {
      items.add('Item ${items.length + 1}');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _showDialog(String tableType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tableType),
          content: widget.dialogContent,
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.nanumGothic(fontSize: 12, color: Palette.black),
        ),
        const SizedBox(height: 6),
        Stack(
          children: [
            Container(
              height: 170,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(244, 244, 244, 1),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
            Positioned(
              top: 5,
              left: 10,
              child: SizedBox(
                width: 240,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.columnList.map((item) {
                    return Container(
                      width: item['width'],
                      decoration: BoxDecoration(
                        border: widget.columnList.indexOf(item) == 0
                            ? null
                            : const Border(
                                left: BorderSide(
                                  color: Color.fromRGBO(168, 168, 168, 0.5),
                                  width: 1,
                                ),
                              ),
                      ),
                      child: Center(
                        child: Text(
                          item['text'],
                          style: GoogleFonts.nanumGothic(
                              fontSize: 12,
                              color: const Color.fromRGBO(168, 168, 168, 1)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 8,
              child: Container(
                width: 244,
                height: 132,
                decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.data.map((item) {
                    return SizedBox(
                      width: item['width'],
                      child: Center(
                        child: Text(
                          item['text'],
                          style: GoogleFonts.nanumGothic(
                              fontSize: 12,
                              color: const Color.fromRGBO(168, 168, 168, 1)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TableButton(
              label: '추가',
              icon: const Icon(MaterialSymbols.add,
                  size: 12, color: Palette.mint),
              showDialog: () {
                _showDialog(widget.tableType);
              },
            ),
            const SizedBox(width: 5),
            TableButton(
              label: '제거',
              icon: const Icon(MaterialSymbols.remove,
                  size: 12, color: Palette.mint),
              showDialog: () {
                _showDialog(widget.tableType);
              },
            ),
          ],
        ),
      ],
    );
    // return Column(
    //   children: <Widget>[
    //     ElevatedButton(
    //       onPressed: addItem,
    //       child: const Text('ADD'),
    //     ),
    //     Expanded(
    //       child: ListView.builder(
    //         itemCount: items.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           return ListTile(
    //             title: Text(items[index]),
    //             trailing: IconButton(
    //               icon: const Icon(Icons.remove),
    //               onPressed: () => removeItem(index),
    //             ),
    //             onTap: _showDialog,
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}
