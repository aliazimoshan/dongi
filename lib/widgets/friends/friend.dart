import 'package:flutter/material.dart';

class FriendWidget extends Container {
  final Color? backgroundColor;
  FriendWidget({
    super.key,
    this.backgroundColor,
    super.width = 64,
    super.height = 64,
  });

  @override
  Decoration? get decoration => BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.black,
      );

  FriendWidget.add({
    super.key,
    super.width = 64,
    super.height = 64,
    this.backgroundColor = Colors.grey,
  }) : super(
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 40,
          ),
        );
}
