import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';

class JobInfomaionWindow extends StatelessWidget {
  const JobInfomaionWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Flexible(
          child: Container(
            color: Palette.grey,
          ),
        ),
        Container(
          color: Palette.mint.withOpacity(0.5),
        ),
      ]),
    );
  }
}
