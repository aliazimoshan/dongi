import 'package:flutter/material.dart';

import '../../constants/color_config.dart';

class CustomFloatingActionButton extends Container {
  final Function onTap;
  CustomFloatingActionButton({required this.onTap, super.key})
      : super(child: child(onTap: onTap));
}

child({required Function onTap}) => InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: ColorConfig.primarySwatch,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: ColorConfig.pureWhite,
          ),
        ),
      ),
    );
