import 'package:flutter/material.dart';

import '../card/card.dart';
import 'list_tile.dart';

class ListTileCard extends CardWidget {
  final String titleString;
  final String? subtitleString;
  final String? headerString;
  final Widget? trailing;
  final Widget? leading;
  final void Function()? onTap;
  const ListTileCard({
    super.key,
    super.borderColor,
    required this.titleString,
    this.subtitleString,
    this.headerString,
    this.trailing,
    this.leading,
    this.onTap,
  });

  @override
  Widget? get child => subtitleString != null
      ? ListTileWidget(
          titleString: titleString,
          subtitleString: subtitleString!,
          headerString: headerString,
          trailing: trailing,
          leading: leading,
          onTap: onTap,
        )
      : ListTileWidget(
          titleString: titleString,
          trailing: trailing,
          headerString: headerString,
          leading: leading,
          onTap: onTap,
        );
}
