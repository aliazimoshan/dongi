import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../extensions/widget_position.dart';

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
    final position = useState<RelativeRect?>(null);

    void onTapDown(TapDownDetails details) {
      position.value = context.widgetPosition(details);
    }

    void onLongPress() {
      if (position.value != null) {
        showMenu(
          context: context,
          position: position.value!,
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

//import 'package:flutter/cupertino.dart';

//class LongPressMenuWidget extends StatelessWidget {
//  final Widget child;
//  final List<CupertinoContextMenuAction> items;
//  //final void Function()? onTap;

//  const LongPressMenuWidget({
//    super.key,
//    required this.child,
//    required this.items,
//    //required this.onTap,
//  });

//  @override
//  Widget build(BuildContext context) {
//    return CupertinoContextMenu(
//      enableHapticFeedback: true,
//      actions: items.map((val) => val).toList(),
//      child: child,
//    );
//  }
//}
