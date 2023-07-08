import 'package:dongi/constants/color_config.dart';
import 'package:dongi/models/group_model.dart';
import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../../../router/router_notifier.dart';
import '../controller/group_controller.dart';

class GroupListView extends StatelessWidget {
  final List<GroupModel> groupModel;
  const GroupListView({required this.groupModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ListView(
        children: groupModel
            .map<Widget>((val) => GroupListCard(groupModel: val))
            .toList(),
      ),
    );
  }
}

class GroupListCard extends ConsumerWidget {
  final GroupModel groupModel;
  const GroupListCard({super.key, required this.groupModel});
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
            RouteName.updateGroup,
            extra: groupModel,
          );
        } else {
          //Delete dropdown action
          showSnackBar(context, "Successfully deleted");
          ref
              .read(groupNotifierProvider.notifier)
              .deleteGroup(context: context, ref: ref, groupModel: groupModel);
        }
      },
      underline: Container(),
      isDense: true,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTileCard(
        onTap: () => context.push(RouteName.groupDetail(groupModel.id)),
        titleString: groupModel.title,
        subtitleString: "Member: ${groupModel.groupUsers.length.toString()}",
        leading: iconWidget(),
        trailing: _dropdownButton(
          ref: ref,
          context: context,
          groupModel: groupModel,
        ),
      ),
    );
  }
}
