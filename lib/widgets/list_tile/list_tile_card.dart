import 'package:flutter/material.dart';

import '../card/card.dart';
import 'list_tile.dart';

class ListTileCard extends CardWidget {
  final String titleString;
  final String? subtitleString;
  final String? headerString;
  final Widget? trailing;
  final Widget? leading;
  const ListTileCard({
    super.key,
    required this.titleString,
    this.subtitleString,
    this.headerString,
    this.trailing,
    this.leading,
  });

  @override
  Widget? get child => subtitleString != null
      ? ListTileWidget(
          titleString: titleString,
          subtitleString: subtitleString!,
          headerString: headerString,
          trailing: trailing,
          leading: leading,
        )
      : ListTileWidget(
          titleString: titleString,
          trailing: trailing,
          headerString: headerString,
          leading: leading,
        );
}
