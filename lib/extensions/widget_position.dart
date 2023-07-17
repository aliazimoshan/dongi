import 'package:flutter/material.dart';

extension WidgetPositionExtension on BuildContext {
  RelativeRect? widgetPosition(TapDownDetails details) {
    // creating instance of renderBox
    final RenderBox box = findRenderObject() as RenderBox;
    // find the coordinate
    final Offset localOffset = box.globalToLocal(details.globalPosition);

    final translation = box.getTransformTo(null).getTranslation();

    final RelativeRect position = RelativeRect.fromLTRB(
      localOffset.dx + translation.x,
      localOffset.dy + translation.y,
      box.size.width,
      box.size.height,
    );
    return position;
  }
}
