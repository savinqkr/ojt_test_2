import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';

// https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/

class TaskPropertyWindow extends StatelessWidget {
  const TaskPropertyWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Palette.mint.withOpacity(0.6),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.flight)),
                      Tab(icon: Icon(Icons.directions_transit)),
                      Tab(icon: Icon(Icons.directions_car)),
                    ],
                  ),
                  // TabBarView(
                  //   children: [
                  //     Icon(Icons.flight, size: 280),
                  //     Icon(Icons.directions_transit, size: 280),
                  //     Icon(Icons.directions_car, size: 280),
                  //   ],
                  // ),
                ],
              ))
        ],
      ),
    );
  }
}
