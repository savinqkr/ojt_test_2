import 'package:flutter/material.dart';
import 'package:ojt_test_2/approval/screens/approval_screen.dart';
import 'package:ojt_test_2/common/models/path.dart';
import 'package:ojt_test_2/common/screens/preparing_screen.dart';
import 'package:ojt_test_2/editor/screens/editor_screen.dart';
import 'package:ojt_test_2/focusview/screens/focusview_screen.dart';
import 'package:ojt_test_2/help/screens/help_screen.dart';
import 'package:ojt_test_2/home/screens/home_screen.dart';
import 'package:ojt_test_2/management_tools/screens/management_tools_screen.dart';
import 'package:ojt_test_2/monitor/screens/monitor_screen.dart';
import 'package:ojt_test_2/notice/screens/notice_screen.dart';
import 'package:ojt_test_2/planner/screens/planner_screen.dart';
import 'package:ojt_test_2/prediction/screens/prediction_screen.dart';
import 'package:ojt_test_2/report/screens/report_screen.dart';

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
    Path(
      r'^' + MonitorScreen.route,
      (context, match) => const MonitorScreen(),
    ),
    Path(
      r'^' + FocusviewScreen.route,
      (context, match) => const FocusviewScreen(),
    ),
    Path(
      r'^' + PredictionScreen.route,
      (context, match) => const PredictionScreen(),
    ),
    Path(
      r'^' + ReportScreen.route,
      (context, match) => const ReportScreen(),
    ),
    Path(
      r'^' + ManagementToolsScreen.route,
      (context, match) => const ManagementToolsScreen(),
    ),
    Path(
      r'^' + ApprovalScreen.route,
      (context, match) => const ApprovalScreen(),
    ),
    Path(
      r'^' + NoticeScreen.route,
      (context, match) => const NoticeScreen(),
    ),
    Path(
      r'^' + HelpScreen.route,
      (context, match) => const HelpScreen(),
    ),
    Path(
      r'^' + PreparingScreen.route,
      (context, match) => const PreparingScreen(),
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
