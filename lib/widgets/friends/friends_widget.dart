import 'package:flutter/material.dart';

import '../../constants/font_config.dart';
import '../card/circle.dart';

class FriendsWidget extends Column {
  final Widget? child;
  FriendsWidget({this.child, super.key});

  @override
  List<Widget> get children => [
        Circle(
          width: 84,
          height: 84,
          child: child,
        ),
        const SizedBox(height: 5),
        Text(
          'data',
          style: FontConfig.body2(),
        ),
      ];
}
