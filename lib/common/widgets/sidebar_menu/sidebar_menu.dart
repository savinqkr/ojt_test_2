import 'package:flutter/material.dart';
import 'package:ojt_test_2/enums/menu.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu_button.dart';

class SidebarMenu extends StatelessWidget {
  final MenuTypes currentMenu;
  final Function? setIsJobTreeVisible;

  const SidebarMenu({
    super.key,
    required this.currentMenu,
    this.setIsJobTreeVisible,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      SidebarMenuButton(
                        menuName: MenuTypes.home,
                        isSelected: currentMenu == MenuTypes.home,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.editor,
                        isSelected: currentMenu == MenuTypes.editor,
                        setIsJobTreeVisible: setIsJobTreeVisible,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.jobFlow,
                        isSelected: currentMenu == MenuTypes.jobFlow,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.planner,
                        isSelected: currentMenu == MenuTypes.planner,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.monitor,
                        isSelected: currentMenu == MenuTypes.monitor,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.focusView,
                        isSelected: currentMenu == MenuTypes.focusView,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.prediction,
                        isSelected: currentMenu == MenuTypes.prediction,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.report,
                        isSelected: currentMenu == MenuTypes.report,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.managementTools,
                        isSelected: currentMenu == MenuTypes.managementTools,
                      ),
                      const SizedBox(height: 10),
                      SidebarMenuButton(
                        menuName: MenuTypes.approval,
                        isSelected: currentMenu == MenuTypes.approval,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SidebarMenuButton(
                menuName: MenuTypes.preparing,
                isSelected: currentMenu == MenuTypes.preparing,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.notice,
                isSelected: currentMenu == MenuTypes.notice,
              ),
              SidebarMenuButton(
                menuName: MenuTypes.help,
                isSelected: currentMenu == MenuTypes.help,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
