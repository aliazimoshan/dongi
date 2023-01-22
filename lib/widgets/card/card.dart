import 'package:dongi/constants/color_config.dart';
import 'package:flutter/material.dart';

class CardWidget extends Card {
  final EdgeInsets? padding;
  final Color? borderColor;
  final Color? backColor;
  const CardWidget({
    super.key,
    super.child,
    super.margin = EdgeInsets.zero,
    super.color,
    this.padding,
    this.borderColor,
    this.backColor,
  });

  @override
  Color? get color => backColor ?? ColorConfig.grey;

  @override
  double? get elevation => 0;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
      );

  @override
  Widget? get child => Padding(
        padding: padding ?? const EdgeInsets.all(10),
        child: super.child,
      );
}
