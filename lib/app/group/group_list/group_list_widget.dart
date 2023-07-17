import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  final List<GroupModel> groupModels;
  const GroupListView(this.groupModels, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SlidableAutoCloseBehavior(
        child: ListView(
          children:
              groupModels.map<Widget>((group) => GroupListCard(group)).toList(),
        ),
      ),
    );
  }
}

class GroupListCard extends ConsumerWidget {
  final GroupModel groupModel;
  const GroupListCard(this.groupModel, {super.key});
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
    final GlobalKey key = GlobalKey();
    deleteGroup() async {
      await ref.read(groupNotifierProvider.notifier).deleteGroup(groupModel);
      if (context.mounted) {
        showSnackBar(context, "Group deleted successfully!!");
      }
    }

    List<PopupMenuEntry> menuItems = [
      PopupMenuItem(
        child: const Text('Edit'),
        onTap: () => context.push(
          RouteName.updateGroup,
          extra: groupModel,
        ),
      ),
      PopupMenuItem(
        onTap: deleteGroup,
        child: const Text('Delete'),
      ),
      PopupMenuItem(
        onTap: () => showSnackBar(context, "Coming soon!!"),
        child: const Text('Invite'),
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
        child: Slidable(
          key: key,
          startActionPane: ActionPane(
            extentRatio: 0.5,
            motion: const ScrollMotion(),
            //dismissible: DismissiblePane(
            //  onDismissed: () => context.push(
            //    RouteName.updateExpense,
            //    extra: {
            //      "expenseModel": expenseModel,
            //    },
            //  ),
            //),
            children: [
              SlidableAction(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                onPressed: (context) => showSnackBar(context, "Coming soon!!"),
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Invite',
              ),
              SlidableAction(
                onPressed: (context) => context.push(
                  RouteName.updateGroup,
                  extra: groupModel,
                ),
                backgroundColor: const Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: deleteGroup,
              //confirmDismiss: () async {
              //  return await showDialog(
              //    context: context,
              //    builder: (context) {
              //      return AlertDialog(
              //        title: Text("Are you sure?"),
              //        actions: [],
              //      );
              //    },
              //  );
              //},
            ),
            children: [
              SlidableAction(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                onPressed: (context) => deleteGroup(),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: ListTileCard(
            titleString: groupModel.title,
            subtitleString:
                "Member: ${groupModel.groupUsers.length.toString()}",
            leading: iconWidget(),
          ),
        ),
      ),
    );
  }
}
