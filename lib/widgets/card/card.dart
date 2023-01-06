import 'package:flutter/material.dart';

class CardWidget extends Card {
  const CardWidget({
    super.key,
    super.child,
    super.margin = EdgeInsets.zero,
  });

  @override
  double? get elevation => 0;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      );

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(10.0),
        child: super.child,
      );
}
