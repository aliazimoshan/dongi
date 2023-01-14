import 'package:flutter/material.dart';
import '../../constants/font_config.dart';

class ListTileWidget extends ListTile {
  final String titleString;
  final String? subtitleString;
  final String? headerString;
  const ListTileWidget({
    super.key,
    super.trailing,
    super.leading,
    required this.titleString,
    this.subtitleString,
    this.headerString,
  });

  @override
  Widget? get title => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerString != null
              ? Text(headerString!, style: FontConfig.overline())
              : const SizedBox(),
          Text(titleString, style: FontConfig.body2()),
        ],
      );

  @override
  Widget? get subtitle => subtitleString != null ? Text(subtitleString!) : null;
}
