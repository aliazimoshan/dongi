import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LongPressMenuWidget extends HookWidget {
  final Widget child;
  final List<PopupMenuEntry> items;
  final void Function()? onTap;
  const LongPressMenuWidget({
    super.key,
    required this.child,
    required this.items,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tapPositionState = useState<Offset?>(null);
    final boxState = useState<RenderBox?>(null);

    void onTapDown(TapDownDetails details) {
      // creating instance of renderBox
      final RenderBox box = context.findRenderObject() as RenderBox;
      // find the coordinate
      final Offset localOffset = box.globalToLocal(details.globalPosition);

      tapPositionState.value = localOffset;
      boxState.value = box;
    }

    void onLongPress() {
      if (tapPositionState.value != null) {
        final translation =
            boxState.value!.getTransformTo(null).getTranslation();

        final RelativeRect position = RelativeRect.fromLTRB(
          tapPositionState.value!.dx + translation.x,
          tapPositionState.value!.dy + translation.y,
          boxState.value!.size.width,
          boxState.value!.size.height,
        );

        showMenu(
          context: context,
          position: position,
          items: items,
          elevation: 8,
        );
      }
    }

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      child: child,
    );
  }
}
