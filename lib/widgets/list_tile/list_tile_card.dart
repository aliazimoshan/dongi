import 'package:flutter/material.dart';

import '../card/card.dart';
import 'list_tile.dart';

class ListTileCard extends CardWidget {
  final String titleString;
  final String? subtitleString;
  final Widget? trailing;
  const ListTileCard({
    super.key,
    required this.titleString,
    this.subtitleString,
    this.trailing,
  });

  @override
  Widget? get child => subtitleString != null
      ? ListTileWidget(
          titleString: titleString,
          subtitleString: subtitleString!,
          trailing: trailing,
        )
      : ListTileWidget(
          titleString: titleString,
          trailing: trailing,
        );
}
