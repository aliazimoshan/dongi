import 'package:flutter/material.dart';

extension WidgetPositionExtension on BuildContext {
  Offset? get widgetPosition {
    final renderObject = findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return offset;
    } else {
      return null;
    }
  }
}
