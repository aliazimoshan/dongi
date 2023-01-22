import 'package:dongi/constants/color_config.dart';
import 'package:flutter/material.dart';
import '../../constants/font_config.dart';

@immutable
class ButtonWidget extends ElevatedButton {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final String? title;
  ButtonWidget({
    super.key,
    required super.onPressed,
    this.title,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  }) : super(child: child(textColor: textColor, title: title));

  @override
  ButtonStyle? get style => ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorConfig.primarySwatch,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor ?? ColorConfig.primarySwatch),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  ButtonWidget.outline({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.textColor = Colors.black,
    this.title,
    super.key,
    super.onPressed,
  }) : super(child: child(textColor: textColor, title: title));
}

Widget child({String? title, Color? textColor}) {
  return SizedBox(
    height: 50,
    child: Center(
      child: Text(
        title ?? "",
        style: FontConfig.button().copyWith(color: textColor),
      ),
    ),
  );
}
