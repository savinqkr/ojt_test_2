import 'package:flutter/material.dart';
import 'package:ojt_test_2/common/models/taskList.dart';

class ListViewWidget extends StatelessWidget {
  final List<ItemData> itemList;

  const ListViewWidget({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(itemList[index].name),
        );
      },
    );
  }
}
