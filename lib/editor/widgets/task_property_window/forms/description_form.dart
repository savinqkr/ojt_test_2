import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/widgets/button.dart';
import 'package:ojt_test_2/common/widgets/textfield_basic.dart';
import 'package:ojt_test_2/config/palette.dart';

class DescriptionForm extends StatelessWidget {
  const DescriptionForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController description = TextEditingController();

    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Palette.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TASK NAME",
                style:
                    GoogleFonts.nanumGothic(fontSize: 16, color: Palette.black),
              ),
              const SizedBox(height: 32),
              TextFieldBasic(
                  label: '설명', controller: description, multiLines: true),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                width: 80,
                height: 24,
                text: '저장',
                textColor: Palette.white,
                textSize: 12,
                buttonColor: Palette.mint.withOpacity(0.75),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
