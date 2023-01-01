import 'package:flutter/material.dart';

import '../../constants/color_config.dart';

class Circle extends Container {
  Circle({
    required super.width,
    required super.height,
    super.color,
    super.child,
    super.key,
  });

  @override
  Decoration? get decoration => BoxDecoration(
        color: color ?? ColorConfig.primarySwatch,
        shape: BoxShape.circle,
      );
}
