import 'package:flutter/material.dart';
import 'button.dart';

@immutable
class NormalButton extends ButtonModel {
  const NormalButton({
    super.key,
    required String title,
    required Function()? onPressed,
    Color? backgroundColor,
  }) : super(
          title: title,
          onPressed: onPressed,
          backgroundColor: backgroundColor ?? Colors.black,
        );
}
