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
              (val) => _groupCard(
                ref: ref,
                context: context,
                groupModel: val,
              ),
            )
            .toList(),
      ),
    );
  }

  _groupCard({
    required GroupModel groupModel,
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
          image: groupModel.image != null
              ? DecorationImage(
                  image: NetworkImage(groupModel.image!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTileCard(
        onTap: () => context.push(RouteNameConfig.groupDetail(groupModel.id)),
        titleString: groupModel.title,
        subtitleString: "Member: ${groupModel.members.length.toString()}",
        leading: iconWidget(),
        trailing: _dropdownButton(
          ref: ref,
          context: context,
          groupModel: groupModel,
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
