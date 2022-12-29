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
        backgroundColor: backgroundColor ?? Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: borderColor ?? Colors.black),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
        //padding: const EdgeInsets.symmetric(
        //  horizontal: 15,
        //  vertical: 15,
        //),
        //textStyle: const TextStyle(fontSize: 15),
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
        style: FontConfig.button(),
      ),
    ),
  );
}
