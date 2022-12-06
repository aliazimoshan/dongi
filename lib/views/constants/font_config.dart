import 'package:flutter/material.dart';

class FontConfig {
  static TextStyle h1() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w600,
        fontSize: 30,
        color: Colors.black,
      );

  static TextStyle p() => const TextStyle(
        fontFamily: "Mulish",
        fontWeight: FontWeight.w300,
        fontSize: 17,
        color: Colors.black,
      );
}
