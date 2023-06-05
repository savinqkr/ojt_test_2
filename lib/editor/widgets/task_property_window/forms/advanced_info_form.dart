import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class AdvancedInfoForm extends StatelessWidget {
  const AdvancedInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Palette.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TASK NAME",
            style: GoogleFonts.nanumGothic(fontSize: 16, color: Palette.black),
          ),
          const SizedBox(height: 16),
          const Text("고급정보"),
        ],
      ),
    );
  }
}
