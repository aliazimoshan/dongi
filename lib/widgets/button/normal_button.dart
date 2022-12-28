import 'package:flutter/material.dart';
import 'button.dart';

@immutable
class NormalButton extends ButtonWidget {
  const NormalButton({
    super.key,
    required String title,
    required Function()? onPressed,
    Color? backgroundColor,
    Color? textColor,
  }) : super(
          title: title,
          onPressed: onPressed,
          backgroundColor: backgroundColor ?? Colors.black,
          textColor: textColor,
        );
}
