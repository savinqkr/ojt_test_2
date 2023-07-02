import 'package:diagram_editor/diagram_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';

class BaseGroupBody extends StatefulWidget {
  final ComponentData componentData;
  final CustomPainter componentPainter;

  const BaseGroupBody(
      {super.key, required this.componentData, required this.componentPainter});

  @override
  State<BaseGroupBody> createState() => _BaseGroupBodyState();
}

class _BaseGroupBodyState extends State<BaseGroupBody> {
  bool isOpen = true;

  void setIsOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final MyComponentData customData = widget.componentData.data;

    return GestureDetector(
      child: CustomPaint(
        painter: widget.componentPainter,
        child: DottedBorder(
          color: Palette.mint,
          dashPattern: const [8, 4],
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
          borderType: BorderType.RRect,
          radius: const Radius.circular(5),
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     setIsOpen();
                    //   },
                    //   child:
                    //       Icon(!isOpen ? Icons.expand_less : Icons.expand_more),
                    // ),
                    const SizedBox(width: 8),
                    Icon(
                      MaterialSymbols.folder,
                      size: 22,
                      color: !isOpen ? Palette.darkGrey : Palette.mint,
                    ),
                    const SizedBox(width: 5),
                    Text(customData.text),
                    const SizedBox(width: 16),
                    Text(
                      'ID : ${widget.componentData.id.substring(0, 4)}',
                      style: const TextStyle(color: Palette.yellow),
                    ),
                  ],
                ),
                if (widget.componentData.childrenIds.isNotEmpty)
                  Row(
                    children: [
                      ...widget.componentData.childrenIds.map((id) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              id.substring(0, 4),
                              style: const TextStyle(
                                  color: Palette.red, fontSize: 12),
                            ),
                          ))
                    ],
                  ),
                if (isOpen)
                  Expanded(
                    child: Container(
                      height: 140,
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: const Row(
                        children: [
                          // Text("isOpen : $isOpen"),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
