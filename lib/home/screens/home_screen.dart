import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Row(
        children: [
          const SidebarMenu(currentMenu: menuType),
          Expanded(
            child: Container(
              color: Colors.blueGrey,
              child: const Center(child: Text("home")),
            ),
          ),
        ],
      ),
    );
  }
}
