import 'package:flutter/material.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget menuWidget;
  final Widget contentWidget;

  const LayoutTemplate(
      {super.key, required this.menuWidget, required this.contentWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [menuWidget, Expanded(child: contentWidget)],
    );
  }
}
