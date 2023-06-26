import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/common/screens/preparing_screen.dart';
import 'package:ojt_test_2/editor/screens/jobflow_screen.dart';
import 'package:ojt_test_2/enums/menu.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/home/screens/home_screen.dart';
import 'package:ojt_test_2/editor/screens/editor_screen.dart';
import 'package:ojt_test_2/planner/screens/planner_screen.dart';
import 'package:ojt_test_2/monitor/screens/monitor_screen.dart';
import 'package:ojt_test_2/focusview/screens/focusview_screen.dart';
import 'package:ojt_test_2/prediction/screens/prediction_screen.dart';
import 'package:ojt_test_2/management_tools/screens/management_tools_screen.dart';
import 'package:ojt_test_2/approval/screens/approval_screen.dart';
import 'package:ojt_test_2/notice/screens/notice_screen.dart';
import 'package:ojt_test_2/help/screens/help_screen.dart';
import 'package:ojt_test_2/report/screens/report_screen.dart';

class SidebarMenuButton extends StatelessWidget {
  final MenuTypes menuName;
  final bool isSelected;
  final Function? setIsJobTreeVisible;

  const SidebarMenuButton({
    super.key,
    required this.menuName,
    required this.isSelected,
    this.setIsJobTreeVisible,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: IconButton(
        icon:
            getMenuIcon(menuName, isSelected), // Replace with the desired icon
        onPressed: () {
          if (setIsJobTreeVisible != null && menuName == MenuTypes.editor) {
            setIsJobTreeVisible!();
          } else {
            Navigator.pushNamed(context, getRoute(menuName));
          }
          // ----------------------------- animation 제거안됨
          // Navigator.pushReplacementNamed(context, getRoute(menuName));
          // ---------------------------- URL 변화 없음
          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //     pageBuilder: (_, __, ___) => getPage(menuName),
          //     transitionDuration: Duration.zero, // 애니메이션 없음
          //   ),
          // );
          // --------------------------------- URL 변화 없음
          // Navigator.of(context).push(
          //   PageRouteBuilder(
          //     pageBuilder: (context, animation, secondaryAnimation) {
          //       return getPage(menuName);
          //     },
          //     transitionDuration: Duration.zero,
          //     transitionsBuilder:
          //         (context, animation, secondaryAnimation, child) {
          //       return child;
          //     },
          //   ),
          // );
        },
      ),
    );
  }

  Widget getMenuIcon(MenuTypes menuName, bool isSelected) {
    switch (menuName) {
      case MenuTypes.home:
        return Icon(
          MaterialSymbols.home,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.editor:
        return Icon(
          MaterialSymbols.design_services,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.planner:
        return Icon(
          MaterialSymbols.calendar_month,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.monitor:
        return Icon(
          MaterialSymbols.browse_activity,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.focusView:
        return Icon(
          MaterialSymbols.filter_center_focus,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.prediction:
        return Icon(
          MaterialSymbols.monitoring,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.report:
        return Icon(
          MaterialSymbols.description,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.managementTools:
        return Icon(
          MaterialSymbols.build,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.approval:
        return Icon(
          MaterialSymbols.history_edu,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.jobFlow:
        return Icon(
          MaterialSymbols.flowsheet,
          size: 24,
          color: isSelected ? Palette.mint : Palette.black,
        );
      case MenuTypes.notice:
        return Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(11.0),
            ),
          ),
          child: Icon(
            MaterialSymbols.notifications,
            size: 18,
            color: isSelected ? Palette.mint : Palette.black,
          ),
        );
      case MenuTypes.help:
        return Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(11.0),
            ),
          ),
          child: Icon(
            MaterialSymbols.question_mark,
            size: 18,
            color: isSelected ? Palette.mint : Palette.black,
          ),
        );
      case MenuTypes.preparing:
        return Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(11.0),
            ),
          ),
          child: Icon(
            MaterialSymbols.circle,
            size: 18,
            color: isSelected ? Palette.mint : Palette.black,
          ),
        );

      default:
        return const Text('No content available');
    }
  }

  String getRoute(MenuTypes menuName) {
    switch (menuName) {
      case MenuTypes.home:
        return HomeScreen.route;
      case MenuTypes.editor:
        return EditorScreen.route;
      case MenuTypes.planner:
        return PlannerScreen.route;
      case MenuTypes.monitor:
        return MonitorScreen.route;
      case MenuTypes.focusView:
        return FocusviewScreen.route;
      case MenuTypes.prediction:
        return PredictionScreen.route;
      case MenuTypes.report:
        return ReportScreen.route;
      case MenuTypes.managementTools:
        return ManagementToolsScreen.route;
      case MenuTypes.approval:
        return ApprovalScreen.route;
      case MenuTypes.notice:
        return NoticeScreen.route;
      case MenuTypes.help:
        return HelpScreen.route;
      case MenuTypes.jobFlow:
        return JobFlowScreem.route;
      case MenuTypes.preparing:
        return PreparingScreen.route;
      default:
        return HomeScreen.route;
    }
  }

  Widget getPage(MenuTypes menuName) {
    switch (menuName) {
      case MenuTypes.home:
        return const HomeScreen();
      case MenuTypes.editor:
        return const EditorScreen();
      case MenuTypes.planner:
        return const PlannerScreen();
      case MenuTypes.monitor:
        return const MonitorScreen();
      case MenuTypes.focusView:
        return const FocusviewScreen();
      case MenuTypes.prediction:
        return const PredictionScreen();
      case MenuTypes.report:
        return const ReportScreen();
      case MenuTypes.managementTools:
        return const ManagementToolsScreen();
      case MenuTypes.approval:
        return const ApprovalScreen();
      case MenuTypes.notice:
        return const NoticeScreen();
      case MenuTypes.help:
        return const HelpScreen();
      case MenuTypes.jobFlow:
        return const JobFlowScreem();
      case MenuTypes.preparing:
        return const PreparingScreen();
      default:
        return const PreparingScreen();
    }
  }
}
