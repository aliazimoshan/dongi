import 'package:flutter/material.dart';
import '../../constants/color_config.dart';
import 'card.dart';

class GreyCardWidget extends CardWidget {
  final double? width;
  final double? height;
  const GreyCardWidget({super.key, super.child, this.width, this.height});

  @override
  Widget? get child => Container(
        //padding: const EdgeInsets.all(10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorConfig.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: super.child,
      );
}
