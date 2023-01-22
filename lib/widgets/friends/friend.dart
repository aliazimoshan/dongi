import 'package:dongi/constants/color_config.dart';
import 'package:flutter/material.dart';

class FriendWidget extends Container {
  final Color? backgroundColor;
  final Color? borderColor;
  FriendWidget({
    super.key,
    this.backgroundColor,
    this.borderColor,
    super.width = 64,
    super.height = 64,
  });

  @override
  Decoration? get decoration => BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.black,
        border: Border.all(color: borderColor ?? Colors.transparent),
      );

  FriendWidget.add({
    super.key,
    super.width = 64,
    super.height = 64,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.black,
  }) : super(
          child: Icon(
            Icons.add_rounded,
            color: ColorConfig.primarySwatch,
            size: 40,
          ),
        );
}
