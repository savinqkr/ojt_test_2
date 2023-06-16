import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class CheckBoxWithLabel extends StatefulWidget {
  final String label;
  final double height;

  const CheckBoxWithLabel(
      {super.key, required this.label, required this.height});

  @override
  State<CheckBoxWithLabel> createState() => _CheckBoxWithLabelState();
}

class _CheckBoxWithLabelState extends State<CheckBoxWithLabel> {
  bool _isChecked = false;

  void onChangeCheck() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      child: Row(
        children: [
          Transform.scale(
            scale: 0.75,
            child: Checkbox(
              value: _isChecked,
              onChanged: (value) {
                onChangeCheck();
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
          Text(
            widget.label,
            style: GoogleFonts.nanumGothic(color: Palette.mint, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
