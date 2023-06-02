import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu_button.dart';
import 'package:ojt_test_2/enums/menu.dart';

class SidebarMenu extends StatelessWidget {
  final MenuTypes currentMenu;

  const SidebarMenu({super.key, required this.currentMenu});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.home,
                isSelected: currentMenu == MenuTypes.home,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.editor,
                isSelected: currentMenu == MenuTypes.editor,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.planner,
                isSelected: currentMenu == MenuTypes.planner,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.monitor,
                isSelected: currentMenu == MenuTypes.monitor,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.focusView,
                isSelected: currentMenu == MenuTypes.focusView,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.prediction,
                isSelected: currentMenu == MenuTypes.prediction,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.report,
                isSelected: currentMenu == MenuTypes.report,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.managementTools,
                isSelected: currentMenu == MenuTypes.managementTools,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.approval,
                isSelected: currentMenu == MenuTypes.approval,
              ),
            ],
          ),
          const Column(
            children: [
              SidebarMenuButton(
                menuName: MenuTypes.notice,
                isSelected: false,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.help,
                isSelected: false,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
