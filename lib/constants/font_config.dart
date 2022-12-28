import 'package:flutter/material.dart';

class FontConfig {
  static TextStyle h1() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.black,
      );

  static TextStyle h2() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black,
      );

  static TextStyle h3() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black,
      );

  static TextStyle p1({Color? color}) => TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color ?? Colors.black,
      );

  static TextStyle p2() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w300,
        fontSize: 16,
        color: Colors.black,
      );

  static TextStyle p3() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: Colors.black,
      );
}
