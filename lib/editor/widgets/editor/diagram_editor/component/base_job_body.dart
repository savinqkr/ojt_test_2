import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/data/custom_component_data.dart';

class BaseJobBody extends StatefulWidget {
  final ComponentData componentData;
  final CustomPainter componentPainter;

  const BaseJobBody(
      {super.key, required this.componentData, required this.componentPainter});

  @override
  State<BaseJobBody> createState() => _BaseJobBodyState();
}

class _BaseJobBodyState extends State<BaseJobBody> {
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
        child: Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
            decoration: BoxDecoration(
                color: Palette.white,
                border: Border.all(
                  width: 1.2,
                  color: const Color.fromRGBO(95, 95, 95, 1),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                const Icon(MaterialSymbols.terminal),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customData.text),
                    const SizedBox(height: 4),
                    Text(
                      'ID : ${widget.componentData.id.substring(0, 4)}',
                      style: const TextStyle(color: Palette.yellow),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.componentData.parentId != null
                            ? widget.componentData.parentId!.substring(0, 4)
                            : '--',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: Palette.mint,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              size: 20,
                              color: Palette.red,
                            ),
                          ])
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
