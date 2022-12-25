import 'package:flutter/material.dart';

@immutable
class ButtonModel extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const ButtonModel({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
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
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: textColor ?? Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
