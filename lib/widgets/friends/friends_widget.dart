import 'package:flutter/material.dart';

import '../../constants/font_config.dart';
import 'circle.dart';

class FriendsWidget extends Column {
  final Widget? child;
  final Function onTap;
  FriendsWidget({this.child, required this.onTap, super.key});

  @override
  List<Widget> get children => [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Circle(
            width: 84,
            height: 84,
            child: child,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'data',
          style: FontConfig.body2(),
        ),
      ];
}
