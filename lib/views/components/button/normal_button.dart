import 'package:flutter/material.dart';
import 'package:testingriverpod/views/components/button/button.dart';

@immutable
class NormalButton extends ButtonModel {
  NormalButton({
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
