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
    final tapPosition = useState<Offset?>(null);

    void onTapDown(TapDownDetails details) {
      // creating instance of renderbox
      final RenderBox box = context.findRenderObject() as RenderBox;
      // find the coordinate
      final Offset localOffset = box.globalToLocal(details.globalPosition);

      tapPosition.value = localOffset;
    }

    void onLongPress() {
      final RenderBox box = context.findRenderObject() as RenderBox;
      final translation = box.getTransformTo(null).getTranslation();

      if (tapPosition.value != null) {
        final RelativeRect position = RelativeRect.fromLTRB(
          tapPosition.value!.dx + translation.x,
          tapPosition.value!.dy + translation.y,
          box.size.width - tapPosition.value!.dx,
          box.size.height - tapPosition.value!.dy,
        );

        print(position);

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
