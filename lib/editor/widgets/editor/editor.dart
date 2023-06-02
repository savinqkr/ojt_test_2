import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';

class Editor extends StatelessWidget {
  const Editor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Palette.white,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Editor",
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "OPEN",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            Text(
              "CLOSE",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
