import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../core/utils.dart';
import '../../../models/group_model.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/list_tile/list_tile_card.dart';
import '../../../widgets/long_press_menu/long_press_menu.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PopupMenuEntry> menuItems = [
      PopupMenuItem(
        value: 1,
        child: const Text('Edit'),
        onTap: () => context.push(
          RouteName.updateGroup,
          extra: groupModel,
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: const Text('Delete'),
        onTap: () {
          showSnackBar(context, "Successfully deleted");
          ref.read(groupNotifierProvider.notifier).deleteGroup(
                context: context,
                ref: ref,
                groupModel: groupModel,
              );
        },
      ),
    ];
    //dropdownButton(GroupModel groupModel) {
    //  List<String> items = ["Edit", "Delete"];

    //  return DropdownButton<String>(
    //    icon: const Icon(Icons.more_vert_outlined),
    //    items: items.map((String item) {
    //      return DropdownMenuItem(
    //        value: item,
    //        child: Text(item),
    //      );
    //    }).toList(),
    //    onChanged: (val) {
    //      if (val == items[0]) {
    //        //Edit dropdown action
    //        context.push(
    //          RouteName.updateGroup,
    //          extra: groupModel,
    //        );
    //      } else {
    //        //Delete dropdown action
    //        showSnackBar(context, "Successfully deleted");
    //        ref.read(groupNotifierProvider.notifier).deleteGroup(
    //            context: context, ref: ref, groupModel: groupModel);
    //      }
    //    },
    //    underline: Container(),
    //    isDense: true,
    //  );
    //}

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: LongPressMenuWidget(
        items: menuItems,
        onTap: () => context.push(RouteName.groupDetail(groupModel.id)),
        child: ListTileCard(
          titleString: groupModel.title,
          subtitleString: "Member: ${groupModel.groupUsers.length.toString()}",
          leading: iconWidget(),
        ),
      ),
    );
  }
}
