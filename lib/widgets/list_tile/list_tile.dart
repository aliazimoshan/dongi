import 'package:flutter/material.dart';
import '../../constants/font_config.dart';

class ListTileWidget extends ListTile {
  final String titleString;
  final String? subtitleString;
  const ListTileWidget({
    super.key,
    super.trailing,
    required this.titleString,
    this.subtitleString,
  });

  @override
  Widget? get title => Text(titleString, style: FontConfig.body2());

  @override
  Widget? get subtitle => subtitleString != null ? Text(subtitleString!) : null;
}
