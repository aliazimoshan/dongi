import 'package:dongi/constants/color_config.dart';
import 'package:dongi/models/group_model.dart';
import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';

class GroupListWidget {
  groupListView(List<GroupModel> groupModel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ListView(
        children: groupModel.map<Widget>((val) => _groupCard(val)).toList(),
      ),
    );
  }

  _groupCard(GroupModel group) {
    iconWidget() {
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConfig.primarySwatch,
          borderRadius: BorderRadius.circular(10),
          image: group.image != null
              ? DecorationImage(
                  image: NetworkImage(group.image!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTileCard(
        titleString: group.title,
        subtitleString: "Member: ${group.members.length.toString()}",
        leading: iconWidget(),
      ),
    );
  }
}
