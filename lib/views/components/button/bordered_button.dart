import 'package:flutter/material.dart';
import 'package:testingriverpod/views/components/button/button.dart';

@immutable
class BorderedButton extends ButtonModel {
  BorderedButton({
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
