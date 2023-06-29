import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/checkbox_with_label.dart';
import 'package:ojt_test_2/config/palette.dart';

class CheckBoxTable extends StatefulWidget {
  final String title;
  final double tableHeight;
  final int crossAxisCount;
  final List<Map> data;

  const CheckBoxTable(
      {super.key,
      required this.data,
      required this.title,
      required this.crossAxisCount,
      required this.tableHeight});

  @override
  State<CheckBoxTable> createState() => _CheckBoxTableState();
}

class _CheckBoxTableState extends State<CheckBoxTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Palette.mint.withOpacity(0.5))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(width: 1, color: Palette.grey))),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.nanumGothic(
                        color: Palette.darkGrey, fontSize: 14),
                  ),
                  const Row(
                    children: [
                      CheckBoxWithLabel(height: 32, label: '사용여부'),
                      SizedBox(width: 10),
                      CheckBoxWithLabel(height: 32, label: '전체'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            // padding: const EdgeInsets.only(top: 5, bottom: 5),
            height: widget.tableHeight,
            child: GridView.count(
              crossAxisCount: widget.crossAxisCount,
              children: widget.data
                  .map(
                    (item) => CheckBoxWithLabel(
                        height: item['height'], label: item['label']),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
