import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:ojt_test_2/config/palette.dart';

// package : https://pub.dev/packages/flutter_fancy_tree_view

class MyNode {
  const MyNode({
    required this.title,
    this.children = const <MyNode>[],
  });

  final String title;
  final List<MyNode> children;
}

class MyTreeView extends StatefulWidget {
  const MyTreeView({super.key});

  @override
  State<MyTreeView> createState() => _MyTreeViewState();
}

class _MyTreeViewState extends State<MyTreeView> {
  static const List<MyNode> roots = <MyNode>[
    MyNode(
      title: '그룹명',
      children: <MyNode>[
        MyNode(
          title: '그룹명',
          children: <MyNode>[
            MyNode(title: '작업명'),
            MyNode(title: '작업명'),
          ],
        ),
        MyNode(title: '작업명'),
      ],
    ),
    MyNode(
      title: '그룹명',
      children: <MyNode>[
        MyNode(
          title: '작업명',
          children: <MyNode>[
            MyNode(title: '작업명'),
          ],
        ),
        MyNode(title: '작업명')
      ],
    ),
  ];

  late final TreeController<MyNode> treeController;

  @override
  void initState() {
    super.initState();
    treeController = TreeController<MyNode>(
      roots: roots,
      childrenProvider: (MyNode node) => node.children,
    );
  }

  @override
  void dispose() {
    treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TreeView<MyNode>(
      treeController: treeController,
      nodeBuilder: (BuildContext context, TreeEntry<MyNode> entry) {
        return MyTreeTile(
          key: ValueKey(entry.node),
          entry: entry,
          onTap: () => treeController.toggleExpansion(entry.node),
        );
      },
    );
  }
}

class MyTreeTile extends StatelessWidget {
  const MyTreeTile({
    super.key,
    required this.entry,
    required this.onTap,
  });

  final TreeEntry<MyNode> entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TreeIndentation(
      entry: entry,
      guide: const ConnectingLinesGuide(
          color: Palette.grey, indent: 30, thickness: 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 3, 0),
        child: Row(
          children: [
            FolderButton(
              isOpen: entry.hasChildren ? entry.isExpanded : null,
              icon: const Icon(
                Icons.article,
                color: Palette.grey,
              ),
              openedIcon: const Icon(
                Icons.arrow_drop_down_outlined,
                color: Palette.mint,
              ),
              closedIcon: const Icon(
                Icons.arrow_right_outlined,
                color: Palette.darkGrey,
              ),
              onPressed: entry.hasChildren ? onTap : null,
            ),
            Container(
              child: entry.hasChildren
                  ? const Row(
                      children: [
                        Icon(
                          Icons.folder,
                          color: Palette.mint,
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  : null,
            ),
            Text(entry.node.title),
          ],
        ),
      ),
    );
  }
}
