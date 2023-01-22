import 'package:flutter/material.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';

class TextFieldWidget extends TextField {
  final String hintText;
  const TextFieldWidget({
    required this.hintText,
    super.key,
    super.maxLines,
  });

  @override
  InputDecoration? get decoration => InputDecoration(
        filled: true,
        fillColor: ColorConfig.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: FontConfig.body2().copyWith(
          color: ColorConfig.midnight.withOpacity(0.5),
        ),
      );

  //  maxLines: maxLines ?? 1,
  //     decoration: InputDecoration(
  //       filled: true,
  //       fillColor: ColorConfig.baseGrey,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //         borderSide: BorderSide.none,
  //       ),
  //       hintText: hintText,
  //       hintStyle: FontConfig.body2().copyWith(
  //         color: ColorConfig.primarySwatch.withOpacity(0.5),
  //       ),
  //     ),

  // @override
  // EdgeInsetsGeometry? get padding => const EdgeInsets.symmetric(horizontal: 15);

  // @override
  // Decoration? get decoration => BoxDecoration(
  //       color: ColorConfig.baseGrey,
  //       borderRadius: BorderRadius.circular(10),
  //     );

  // @override
  // Widget? get child => TextField(
  //       maxLines: maxLines ?? 1,
  //       decoration: InputDecoration(
  //         filled: true,
  //         fillColor: ColorConfig.baseGrey,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //           borderSide: BorderSide.none,
  //         ),
  //         hintText: hintText,
  //         hintStyle: FontConfig.body2().copyWith(
  //           color: ColorConfig.primarySwatch.withOpacity(0.5),
  //         ),
  //       ),
  //     );
}
