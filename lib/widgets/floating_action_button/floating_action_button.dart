import 'package:flutter/material.dart';
import '../../constants/color_config.dart';

class FloatingActionButtonWidget extends FloatingActionButton {
  const FloatingActionButtonWidget({super.key, super.onPressed, super.child});

  @override
  VoidCallback? get onPressed => super.onPressed ?? () {};

  @override
  Widget? get child =>
      super.child ?? Icon(Icons.add, color: ColorConfig.pureWhite);
}
