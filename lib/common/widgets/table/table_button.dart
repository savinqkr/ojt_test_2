import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class TableButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function onClick;

  const TableButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Center(
            child: Row(
              children: [
                icon,
                Text(
                  label,
                  style: GoogleFonts.nanumGothic(
                      fontSize: 12, color: Palette.mint),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
