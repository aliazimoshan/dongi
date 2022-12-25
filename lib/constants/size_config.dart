import 'package:flutter/material.dart';

class SizeConfig {
  static double? width(context) => MediaQuery.of(context).size.width;
  static double? height(context) => MediaQuery.of(context).size.height;
}
