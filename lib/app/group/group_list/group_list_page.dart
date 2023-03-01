import 'package:dongi/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import '../controller/group_controller.dart';
import 'group_list_widget.dart';

class GroupListPage extends ConsumerWidget with GroupListWidget {
  GroupListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(title: "Groups"),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () => ref.read(groupControllerProvider.notifier).addGroup(
              context: context,
              groupModel: GroupModel(
                title: "title",
                description: "description",
                creatorId: "creatorId",
                members: [],
              ),
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView(
          children: [
            groupCard("Group Name", "Member: 2"),
            groupCard("Group Name", "Member: 3"),
            groupCard("Group Name", "Member: 2"),
            groupCard("Group Name", "Member: 7"),
          ],
        ),
      ),
    );
  }
}
