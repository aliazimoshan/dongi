import 'package:dongi/constants/color_config.dart';
import 'package:dongi/constants/route_config.dart';
import 'package:dongi/models/group_model.dart';
import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/group_controller.dart';

class GroupListWidget {
  groupListView({
    required List<GroupModel> groupModel,
    required WidgetRef ref,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ListView(
        children: groupModel
            .map<Widget>(
              (val) => _groupCard(group: val, ref: ref, context: context),
            )
            .toList(),
      ),
    );
  }

  _groupCard({
    required GroupModel group,
    required WidgetRef ref,
    required BuildContext context,
  }) {
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
        trailing: _dropdownButton(
          ref: ref,
          context: context,
          groupModel: group,
        ),
      ),
    );
  }

  _dropdownButton({
    required WidgetRef ref,
    required BuildContext context,
    required GroupModel groupModel,
  }) {
    List<String> items = ["Edit", "Delete"];

    return DropdownButton<String>(
      icon: const Icon(Icons.more_vert_outlined),
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (val) {
        if (val == items[0]) {
          //Edit dropdown action
          context.push(
            RouteNameConfig.updateGroup,
            extra: groupModel,
          );
        } else {
          //Delete dropdown action
          ref
              .read(groupControllerProvider.notifier)
              .deleteGroup(context: context, ref: ref, groupModel: groupModel);
        }
      },
      underline: Container(),
      isDense: true,
    );
  }
}
