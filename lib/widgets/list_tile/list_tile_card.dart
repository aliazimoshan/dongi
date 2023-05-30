import 'package:flutter/material.dart';
import '../card/card.dart';
import 'list_tile.dart';

class ListTileCard extends CardWidget {
  final String titleString;
  final String? subtitleString;
  final String? headerString;
  final Widget? trailing;
  final Widget? leading;
  final VisualDensity? visualDensity;
  final void Function()? onTap;
  const ListTileCard({
    super.key,
    super.borderColor,
    super.backColor,
    required this.titleString,
    this.subtitleString,
    this.headerString,
    this.trailing,
    this.leading,
    this.onTap,
    this.visualDensity,
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
          visualDensity: visualDensity,
        )
      : ListTileWidget(
          titleString: titleString,
          trailing: trailing,
          headerString: headerString,
          leading: leading,
          onTap: onTap,
          visualDensity: visualDensity,
          contentPadding: const EdgeInsets.all(10),
        );
}
