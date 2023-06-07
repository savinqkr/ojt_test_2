import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';

// * icon, name을 받아서 task를 생성함 *

class Task extends StatelessWidget {
  final IconData? icon;
  final String text;

  const Task({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Palette.grey, width: 1),
      ),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              print('component click!');
            },
            icon: Icon(icon),
            iconSize: 33,
            color: const Color(0xff999999),
          ),
          // const SizedBox(
          //   height: 3,
          // ),
          Text(
            text,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
