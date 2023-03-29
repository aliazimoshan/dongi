import 'package:dongi/constants/color_config.dart';
import 'package:flutter/material.dart';

class FriendWidget extends Container {
  final Color? backgroundColor;
  final Color? borderColor;
  final String? image;
  FriendWidget({
    super.key,
    this.backgroundColor,
    this.borderColor,
    super.width = 64,
    super.height = 64,
    this.image,
  });

  @override
  Decoration? get decoration => BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? ColorConfig.midnight,
        border: Border.all(color: borderColor ?? ColorConfig.midnight),
        image: image != null
            ? DecorationImage(
                image: NetworkImage(image!),
              )
            : null,
      );

  FriendWidget.add({
    super.key,
    super.width = 64,
    super.height = 64,
    this.backgroundColor = Colors.transparent,
    this.borderColor,
    this.image,
  }) : super(
          child: Icon(
            Icons.add_rounded,
            color: ColorConfig.primarySwatch,
            size: 40,
          ),
        );
}
