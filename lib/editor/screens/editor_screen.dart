import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/common/templates/layout_template.dart';
import 'package:ojt_test_2/common/widgets/sidebar_menu/sidebar_menu.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/enums/menu.dart';

class EditorScreen extends StatelessWidget {
  static const String route = '/editor';
  static const MenuTypes menuType = MenuTypes.editor;

  const EditorScreen({super.key});

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
          contentWidget: Row(
            children: [
              Container(
                width: 200,
                color: Palette.mint.withOpacity(0.7),
              ),
              Container(
                width: 160,
                color: Palette.mint.withOpacity(0.3),
              ),
              Expanded(
                child: Container(
                  width: 200,
                  color: Palette.white,
                ),
              ),
              Container(
                width: 300,
                color: Palette.mint.withOpacity(0.6),
              ),
            ],
          )),
    );
  }
}
