import 'package:flutter/material.dart';

// * icon, name을 받아서 task 하나를 생성함 *

class Task extends StatelessWidget {
  final Icon? icon;
  final IconData? iconData;
  final String name;

  const Task({
    Key? key,
    required this.name,
    this.icon,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 70,
    //   height: 70,
    //   margin: const EdgeInsets.all(3),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(5),
    //     border: Border.all(color: Palette.grey, width: 1),
    //   ),
    //   child: Column(
    //     children: [
    //       IconButton(
    //         onPressed: () {
    //           print(name);
    //         },
    //         icon: icon ?? Icon(iconData),
    //         iconSize: 24,
    //         color: const Color(0xff999999),
    //       ),
    //       Text(
    //         name,
    //         style: const TextStyle(fontSize: 10),
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(color: Palette.grey, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? Icon(iconData),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
