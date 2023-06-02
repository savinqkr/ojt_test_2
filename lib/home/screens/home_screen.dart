import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/templates/layout_template.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu.dart';
import 'package:ojt_test_2/enums/menu.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';
  static const MenuTypes menuType = MenuTypes.home;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Text('OJT Project',
              style:
                  GoogleFonts.nanumGothic(color: Colors.black, fontSize: 12)),
          centerTitle: true,
        ),
      ),
      body: LayoutTemplate(
        menuWidget: const SidebarMenu(currentMenu: menuType),
        contentWidget: Container(
          color: const Color.fromARGB(255, 255, 188, 64),
          child: const Center(child: Text("HOME")),
        ),
      ),
    );
  }
}
