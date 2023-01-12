import 'package:flutter/material.dart';
import '../../constants/color_config.dart';
import 'card.dart';

class GreyCardWidget extends CardWidget {
  final double? width;
  final double? height;
  const GreyCardWidget({super.key, super.child, this.width, this.height});

  @override
  Widget? get child => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorConfig.baseGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: super.child,
      );
}
