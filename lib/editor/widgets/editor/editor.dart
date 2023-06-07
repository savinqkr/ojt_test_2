import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';

class Editor extends StatelessWidget {
  final bool isPropertyWindowVisible;
  final Function setIsPropertyWindowVisible;

  const Editor(
      {super.key,
      required this.setIsPropertyWindowVisible,
      required this.isPropertyWindowVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Palette.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Editor",
              style: TextStyle(fontSize: 60),
            ),
            const SizedBox(
              height: 30,
            ),
            // Text(
            //   "OPEN",
            //   style: TextStyle(color: Colors.blue, fontSize: 18),
            // ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setIsPropertyWindowVisible();
                },
                child: Text(
                  isPropertyWindowVisible ? "CLOSE" : "OPEN",
                  style: TextStyle(
                      color: isPropertyWindowVisible ? Colors.red : Colors.blue,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
