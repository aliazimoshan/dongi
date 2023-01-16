import 'package:flutter/material.dart';

class CardWidget extends Card {
  final EdgeInsets? padding;
  final Color? borderColor;
  const CardWidget({
    super.key,
    super.child,
    super.margin = EdgeInsets.zero,
    super.color,
    this.padding,
    this.borderColor,
  });

  @override
  double? get elevation => 0;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
      );

  @override
  Widget? get child => Padding(
        padding: padding ?? const EdgeInsets.all(15.0),
        child: super.child,
      );
}
