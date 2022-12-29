import 'package:flutter/material.dart';

class FontConfig {
  static TextStyle h4({Color? color}) => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w200,
        fontSize: 34,
        color: Colors.black,
      );
  static TextStyle h6({Color? color}) => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w200,
        fontSize: 20,
        color: Colors.black,
      );

  static TextStyle body1({Color? color}) => TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w200,
        fontSize: 16,
        color: color ?? Colors.black,
      );

  static TextStyle body2({Color? color}) => TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w200,
        fontSize: 14,
        color: color ?? Colors.black,
      );

  static TextStyle button({Color? color}) => TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: color ?? Colors.black,
      );

  static TextStyle caption() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w100,
        fontSize: 12,
        color: Colors.black,
      );

  static TextStyle overline() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w100,
        fontSize: 10,
        color: Colors.black,
      );
}
