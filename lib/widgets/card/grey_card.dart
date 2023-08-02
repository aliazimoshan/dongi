import 'package:flutter/material.dart';

import '../../constants/color_config.dart';
import 'card.dart';

class GreyCardWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  const GreyCardWidget(
      {super.key, this.width, this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Container(
        //padding: const EdgeInsets.all(10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorConfig.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
