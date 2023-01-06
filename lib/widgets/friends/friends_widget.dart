import 'package:flutter/material.dart';

class FriendWidget extends Container {
  final Color? backgroundColor;
  FriendWidget({
    super.key,
    this.backgroundColor,
  });

  @override
  Decoration? get decoration => BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.black,
      );

  FriendWidget.add({
    super.key,
    this.backgroundColor = Colors.black,
  }) : super(
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        );
}
