import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/dialog/edit_component_dialog.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/custom_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/option_icon_origin.dart';

import '../../option_icon.dart';

mixin MyComponentWidgetsPolicy
    implements ComponentWidgetsPolicy, CustomStatePolicy {
  @override
  Widget showCustomWidgetWithComponentDataOver(
      BuildContext context, ComponentData componentData) {
    bool isJunction = componentData.type == 'junction';
    bool showOptions = (!isMultipleSelectionOn) &&
        (!isReadyToConnect) &&
        (!isReadyToAddParent) &&
        !isJunction;

    return Visibility(
      visible: componentData.data.isHighlightVisible,
      child: Stack(
        children: [
          if (showOptions) componentWidgetOptions(componentData, context),
          // if (showOptions) componentTopOptions(componentData, context),
          // if (showOptions) componentBottomOptions(componentData),
          highlight(
              componentData, isMultipleSelectionOn ? Colors.cyan : Palette.red),
          if (showOptions) resizeCorner(componentData),
          if (isJunction && !isReadyToConnect && !isReadyToAddParent)
            junctionOptions(componentData),
        ],
      ),
    );
  }

  Widget componentWidgetOptions(ComponentData componentData, context) {
    Offset componentPosition =
        canvasReader.state.toCanvasCoordinates(componentData.position);
    return Positioned(
      left: componentPosition.dx + 90,
      top: componentPosition.dy + 35,
      child: Container(
        height: 36,
        width: 240,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: Palette.mint.withOpacity(0.3),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OptionIcon(
              iconData: Icons.delete_forever,
              tooltip: 'delete',
              size: 30,
              onPressed: () {
                canvasWriter.model.removeComponent(componentData.id);
                selectedComponentId = null;
              },
              iconColor: Palette.darkGrey,
              iconSize: 20.0,
              shape: BoxShape.circle,
            ),
            OptionIcon(
              iconData: Icons.edit,
              tooltip: 'edit',
              size: 30,
              onPressed: () => showEditComponentDialog(context, componentData),
              iconColor: Palette.darkGrey,
              iconSize: 20.0,
              shape: BoxShape.circle,
            ),
            OptionIcon(
              // iconData: Icons.arrow_right_alt,
              iconData: Icons.link,
              tooltip: 'connect',
              size: 30,
              onPressed: () {
                isReadyToConnect = true;
                componentData.updateComponent();
              },
              iconColor: Palette.darkGrey,
              iconSize: 20.0,
              shape: BoxShape.circle,
            ),
            OptionIcon(
              iconData: Icons.link_off,
              tooltip: 'remove links',
              size: 30,
              onPressed: () => canvasWriter.model
                  .removeComponentConnections(componentData.id),
              iconColor: Palette.darkGrey,
              iconSize: 20.0,
              shape: BoxShape.circle,
            ),
            OptionIcon(
              iconData: Icons.person_add,
              tooltip: 'Add parent',
              size: 30,
              onPressed: () {
                // isReadyToAddParent = true;
                // componentData.updateComponent();
                print('Add parent');
              },
              iconColor: Palette.darkGrey,
              iconSize: 20.0,
              shape: BoxShape.circle,
            ),
            OptionIcon(
              iconData: Icons.person_remove,
              tooltip: 'Remove parent',
              size: 30,
              onPressed: () {
                print('Remove parent');
              },
              iconColor: Palette.darkGrey,
              iconSize: 20.0,
              shape: BoxShape.circle,
            ),
          ],
        ),
      ),
    );
  }

  Widget componentTopOptions(ComponentData componentData, context) {
    Offset componentPosition =
        canvasReader.state.toCanvasCoordinates(componentData.position);
    return Positioned(
      left: componentPosition.dx - 24,
      top: componentPosition.dy - 48,
      child: Row(
        children: [
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.delete_forever,
            tooltip: 'delete',
            size: 40,
            onPressed: () {
              canvasWriter.model.removeComponent(componentData.id);
              selectedComponentId = null;
            },
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
          const SizedBox(width: 12),
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.copy,
            tooltip: 'duplicate',
            size: 40,
            onPressed: () {
              String newId = duplicate(componentData);
              canvasWriter.model.moveComponentToTheFront(newId);
              selectedComponentId = newId;
              hideComponentHighlight(componentData.id);
              highlightComponent(newId);
            },
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
          const SizedBox(width: 12),
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.edit,
            tooltip: 'edit',
            size: 40,
            onPressed: () => showEditComponentDialog(context, componentData),
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
          const SizedBox(width: 12),
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.link_off,
            tooltip: 'remove links',
            size: 40,
            onPressed: () =>
                canvasWriter.model.removeComponentConnections(componentData.id),
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
        ],
      ),
    );
  }

  Widget componentBottomOptions(ComponentData componentData) {
    Offset componentBottomLeftCorner = canvasReader.state.toCanvasCoordinates(
        componentData.position + componentData.size.bottomLeft(Offset.zero));
    return Positioned(
      left: componentBottomLeftCorner.dx - 16,
      top: componentBottomLeftCorner.dy + 8,
      child: Row(
        children: [
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.arrow_upward,
            tooltip: 'bring to front',
            size: 24,
            shape: BoxShape.rectangle,
            onPressed: () =>
                canvasWriter.model.moveComponentToTheFront(componentData.id),
            iconColor: Colors.black,
            iconSize: 20.0,
          ),
          const SizedBox(width: 12),
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.arrow_downward,
            tooltip: 'move to back',
            size: 24,
            shape: BoxShape.rectangle,
            onPressed: () =>
                canvasWriter.model.moveComponentToTheBack(componentData.id),
            iconColor: Colors.black,
            iconSize: 20.0,
          ),
          const SizedBox(width: 40),
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.arrow_right_alt,
            tooltip: 'connect',
            size: 40,
            onPressed: () {
              isReadyToConnect = true;
              componentData.updateComponent();
            },
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
          const SizedBox(width: 12),
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.person_add,
            tooltip: 'Add parent',
            size: 40,
            onPressed: () {
              isReadyToAddParent = true;
              componentData.updateComponent();
            },
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
        ],
      ),
    );
  }

  Widget highlight(ComponentData componentData, Color color) {
    return Positioned(
      left: canvasReader.state
          .toCanvasCoordinates(componentData.position - const Offset(5, 5))
          .dx,
      top: canvasReader.state
          .toCanvasCoordinates(componentData.position - const Offset(5, 5))
          .dy,
      child: CustomPaint(
        painter: ComponentHighlightPainter(
          width: (componentData.size.width + 10) * canvasReader.state.scale,
          height: (componentData.size.height + 10) * canvasReader.state.scale,
          color: color,
        ),
      ),
    );
  }

  resizeCorner(ComponentData componentData) {
    Offset componentBottomRightCorner = canvasReader.state.toCanvasCoordinates(
        componentData.position + componentData.size.bottomRight(Offset.zero));
    return Positioned(
      left: componentBottomRightCorner.dx - 12,
      top: componentBottomRightCorner.dy - 12,
      child: GestureDetector(
        onPanUpdate: (details) {
          canvasWriter.model.resizeComponent(
              componentData.id, details.delta / canvasReader.state.scale);
          canvasWriter.model.updateComponentLinks(componentData.id);
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.resizeDownRight,
          child: Container(
            width: 24,
            height: 24,
            color: Colors.transparent,
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget junctionOptions(ComponentData componentData) {
    Offset componentPosition =
        canvasReader.state.toCanvasCoordinates(componentData.position);
    return Positioned(
      left: componentPosition.dx - 24,
      top: componentPosition.dy - 48,
      child: Row(
        children: [
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.delete_forever,
            tooltip: 'delete',
            size: 32,
            onPressed: () {
              canvasWriter.model.removeComponent(componentData.id);
              selectedComponentId = null;
            },
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
          const SizedBox(width: 8),
          OptionIconOrigin(
            color: Colors.grey.withOpacity(0.7),
            iconData: Icons.arrow_right_alt,
            tooltip: 'connect',
            size: 32,
            onPressed: () {
              isReadyToConnect = true;
              componentData.updateComponent();
            },
            iconColor: Colors.black,
            iconSize: 20.0,
            shape: BoxShape.rectangle,
          ),
        ],
      ),
    );
  }
}
