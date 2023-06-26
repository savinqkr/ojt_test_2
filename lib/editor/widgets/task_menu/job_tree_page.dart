import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:ojt_test_2/common/models/job_data.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/getX/tree_to_tab_controller.dart';

// package : https://pub.dev/packages/flutter_fancy_tree_view

class MyNode {
  MyNode({
    required this.title,
    required this.isGroup,
    List<MyNode>? children,
  }) : children = children ?? [];

  final String title;
  final List<MyNode> children;
  final bool isGroup;

  void addChild(MyNode child) {
    children.add(child);
  }

  void removeChild(MyNode child) {
    children.remove(child);
  }
}

class MyTreeView extends StatefulWidget {
  const MyTreeView({Key? key}) : super(key: key);

  @override
  State<MyTreeView> createState() => _MyTreeViewState();
}

class _MyTreeViewState extends State<MyTreeView> {
  late final TreeController<MyNode> treeController;
  final MyNode rootNode = MyNode(
    title: 'Root',
    isGroup: true,
    children: <MyNode>[
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
    ],
  );

  @override
  void initState() {
    super.initState();
    treeController = TreeController<MyNode>(
      roots: [rootNode],
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
          entry: entry,
          onTap: () => treeController.toggleExpansion(entry.node),
          addNode: addNode,
          removeNode: removeNode,
        );
      },
    );
  }

  // ----------------- child node add method
  addNode(MyNode parentNode, bool isGroup, String title) {
    setState(() {
      int totalGroupCount =
          _MyTreeTileState().countGroupNodes(rootNode.children, true);
      int totalJobCount =
          _MyTreeTileState().countGroupNodes(rootNode.children, false) + 4;

      MyNode newChildNode = MyNode(
        title:
            '$title ${isGroup ? totalGroupCount + 1 : totalJobCount + 1}', // 그룹 노드의 카운트를 사용하여 타이틀 생성
        isGroup: isGroup,
        children: <MyNode>[],
      );
      parentNode.addChild(newChildNode);
      treeController.roots = [rootNode];

      if (!isGroup) {
        JobData().addJob(totalJobCount + 1, parentNode.title);
      }
    });
  }

  // ------------------- node delete method
  void removeNode(MyNode parentNode, MyNode nodeToRemove) {
    setState(() {
      parentNode.removeChild(nodeToRemove);
      treeController.roots = [rootNode];
    });
  }
}

class MyTreeTile extends StatefulWidget {
  const MyTreeTile({
    Key? key,
    required this.entry,
    required this.onTap,
    required this.addNode,
    required this.removeNode,
  }) : super(key: key);

  final TreeEntry<MyNode> entry;
  final VoidCallback onTap;
  final void Function(MyNode, bool, String) addNode;
  final void Function(MyNode, MyNode) removeNode;

  @override
  State<MyTreeTile> createState() => _MyTreeTileState();
}

class _MyTreeTileState extends State<MyTreeTile> {
  int countGroupNodes(List<MyNode> nodes, bool state) {
    int count = 0;
    for (var node in nodes) {
      if (node.isGroup == state) {
        // true면 그룹, false면 작업
        count++;
        count +=
            countGroupNodes(node.children, state); // 재귀적으로 자식 노드에서 그룹 노드 개수 계산
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TreeToTabController());

    return GestureDetector(
      onTap: () {
        Get.find<TreeToTabController>()
            .getSelectedJobId(widget.entry.node.title);
        widget.entry.node.isGroup ? print("GROUP") : print("JOB");
      },
      onSecondaryTapDown: (details) {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(details.globalPosition, details.globalPosition),
          Offset.zero & overlay.size,
        );
        List jobDataList = JobData().jobList;
        String selectId = widget.entry.node.title;
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
                      widget.removeNode(
                        widget.entry.parent?.node ??
                            MyNode(title: '', isGroup: false),
                        widget.entry.node,
                      );
                    },
                  ),
                ],
              )
            : showMenu(
                context: context,
                position: position,
                items: [
                  PopupMenuItem<int>(
                    value: 1,
                    child: const Text('그룹 추가'),
                    onTap: () {
                      widget.addNode(widget.entry.node, true, "Group");
                    },
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: const Text('그룹 삭제'),
                    onTap: () {
                      widget.removeNode(
                        widget.entry.parent?.node ??
                            MyNode(title: '', isGroup: false),
                        widget.entry.node,
                      );
                    },
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: const Text('작업 추가'),
                    onTap: () {
                      widget.addNode(widget.entry.node, false, "Sample");
                    },
                  ),
                ],
              );
      },
      child: TreeIndentation(
        entry: widget.entry,
        guide: const ConnectingLinesGuide(
            color: Palette.grey, indent: 30, thickness: 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 3, 0),
          child: Row(
            children: [
              FolderButton(
                isOpen:
                    widget.entry.hasChildren ? widget.entry.isExpanded : null,
                icon: widget.entry.node.isGroup
                    ? const Icon(
                        Icons.folder,
                        color: Palette.mint,
                      )
                    : const Icon(
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
                onPressed: widget.entry.hasChildren ? widget.onTap : null,
              ),
              Container(
                child: widget.entry.node.isGroup && widget.entry.hasChildren
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
              Text(
                widget.entry.node.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
