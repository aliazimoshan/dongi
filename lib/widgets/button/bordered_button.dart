import 'package:flutter/material.dart';
import 'button.dart';

@immutable
class BorderedButton extends ButtonWidget {
  const BorderedButton({
    super.key,
    required String title,
    Color? borderColor,
    required Function()? onPressed,
  }) : super(
          title: title,
          onPressed: onPressed,
          backgroundColor: Colors.white,
          borderColor: borderColor,
          textColor: Colors.black,
        );
}
