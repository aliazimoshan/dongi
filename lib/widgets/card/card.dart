import 'package:flutter/material.dart';

class CardWidget extends Card {
  final EdgeInsets? padding;
  const CardWidget({
    super.key,
    super.child,
    super.margin = EdgeInsets.zero,
    this.padding,
  });

  @override
  double? get elevation => 0;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      );

  @override
  Widget? get child => Padding(
        padding: padding ?? const EdgeInsets.all(15.0),
        child: super.child,
      );
}
