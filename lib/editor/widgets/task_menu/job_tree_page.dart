import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:ojt_test_2/common/models/job_data.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/getX/tree_to_tab_controller.dart';

// package : https://pub.dev/packages/flutter_fancy_tree_view

class MyNode {
  const MyNode({
    required this.title,
    required this.isGroup,
    this.children = const <MyNode>[],
  });

  final String title;
  final List<MyNode> children;
  final bool isGroup;
}

class MyTreeView extends StatefulWidget {
  const MyTreeView({super.key});

  @override
  State<MyTreeView> createState() => _MyTreeViewState();
}

class _MyTreeViewState extends State<MyTreeView> {
  static const List<MyNode> roots = <MyNode>[
    MyNode(
      title: 'Group 1',
      isGroup: true,
      children: <MyNode>[
        MyNode(
          title: 'Group 2',
          isGroup: true,
          children: <MyNode>[
            MyNode(title: 'Sample 1', isGroup: false),
            MyNode(title: 'Sample 2', isGroup: false),
          ],
        ),
        MyNode(title: 'Sample 3', isGroup: false),
      ],
    ),
    MyNode(
      title: 'Group 3',
      isGroup: true,
      children: <MyNode>[
        MyNode(
          title: 'Group 4',
          isGroup: true,
          children: <MyNode>[
            MyNode(title: 'Sample 4', isGroup: false),
          ],
        ),
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
    Get.put(TreeToTabController());

    return GestureDetector(
      onTap: () {
        Get.find<TreeToTabController>().getSelectedJobId(entry.node.title);
      },
      onSecondaryTapDown: (details) {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(details.globalPosition, details.globalPosition),
          Offset.zero & overlay.size,
        );
        List jobDataList = JobData().jobList;
        String selectId = entry.node.title;
        bool isJob(jobDataList, selectId) {
          for (var item in jobDataList) {
            if (item['name'] == selectId) {
              return true;
            }
          }
          return false;
        }

        isJob(jobDataList, selectId)
            ? showMenu(
                context: context,
                position: position,
                items: [
                  PopupMenuItem<int>(
                    value: 2,
                    child: const Text('작업 삭제'),
                    onTap: () {
                      print(selectId);
                    },
                  ),
                ],
              )
            : showMenu(
                context: context,
                position: position,
                items: [
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('그룹 추가'),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text('그룹 삭제'),
                  ),
                  const PopupMenuItem<int>(
                    value: 3,
                    child: Text('작업 추가'),
                  ),
                ],
              );
      },
      child: TreeIndentation(
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
      ),
    );
  }
}
