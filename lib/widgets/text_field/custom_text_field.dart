import 'package:flutter/material.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';

class CustomTextField extends Container {
  final String hintText;
  CustomTextField({
    super.height = 50,
    super.alignment = Alignment.centerLeft,
    required this.hintText,
    super.key,
  });

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.symmetric(horizontal: 15);

  @override
  Decoration? get decoration => BoxDecoration(
        color: ColorConfig.baseGrey,
        borderRadius: BorderRadius.circular(10),
      );

  @override
  Widget? get child => TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: FontConfig.body2().copyWith(
            color: ColorConfig.primarySwatch.withOpacity(0.5),
          ),
        ),
      );
}
