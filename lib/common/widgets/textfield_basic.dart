import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class TextFieldBasic extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? required;
  final bool? multiLines;

  const TextFieldBasic(
      {super.key,
      required this.label,
      required this.controller,
      this.multiLines,
      this.required});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              Text(
                label,
                style:
                    GoogleFonts.nanumGothic(fontSize: 12, color: Palette.black),
              ),
              const SizedBox(width: 5),
              if (required != null && required == true)
                Text(
                  '*',
                  style:
                      GoogleFonts.nanumGothic(fontSize: 12, color: Palette.red),
                ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: multiLines == true ? 240 : 32,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
          child: TextField(
            controller: controller,
            style: GoogleFonts.nanumGothic(fontSize: 14, color: Palette.black),
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
            maxLines: multiLines == true ? null : 1,
          ),
        ),
      ],
    );
  }
}
