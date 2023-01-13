import 'package:dongi/constants/color_config.dart';
import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';

import '../../../widgets/list_tile/list_tile.dart';

class GroupListWidget {
  groupCard(String title, String subtitle) {
    iconWidget() {
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConfig.primarySwatch,
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTileCard(
        titleString: title,
        subtitleString: subtitle,
        leading: iconWidget(),
      ),
    );
  }
}
