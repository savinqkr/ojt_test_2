import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ojt_test_2/common/templates/layout_template.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu.dart';
import 'package:ojt_test_2/enums/menu.dart';

class PreparingScreen extends StatelessWidget {
  static const String route = '/preparing';
  static const MenuTypes menuType = MenuTypes.preparing;

  const PreparingScreen({super.key});

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
        contentWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  "https://assets1.lottiefiles.com/packages/lf20_ybfPAtf8S7.json"),
              const SizedBox(
                height: 40,
              ),
              Text("Coming soon", style: GoogleFonts.nanumGothic(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
