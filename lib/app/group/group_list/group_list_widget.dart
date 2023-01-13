import 'package:flutter/material.dart';

import '../../../widgets/list_tile/list_tile.dart';

class GroupListWidget {
  groupCard(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTileWidget(
        titleString: title,
        subtitleString: subtitle,
        //icon: Container(
        //  width: 50,
        //  height: 50,
        //  decoration: BoxDecoration(
        //    borderRadius: BorderRadius.circular(5),
        //    color: Colors.black,
        //  ),
        //),
      ),
    );
  }
}
