import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/path.dart';
import 'package:ojt_test_2/editor/screens/editor_screen.dart';
import 'package:ojt_test_2/home/screens/home_screen.dart';
import 'package:ojt_test_2/planner/screens/planner_screen.dart';

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + HomeScreen.route,
      (context, match) => const HomeScreen(),
    ),
    Path(
      r'^' + EditorScreen.route,
      (context, match) => const EditorScreen(),
    ),
    Path(
      r'^' + PlannerScreen.route,
      (context, match) => const PlannerScreen(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final match = regExpPattern.firstMatch(settings.name!)!.group(0);
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match!),
          settings: settings,
        );
      }
    }

    return null;
  }
}
