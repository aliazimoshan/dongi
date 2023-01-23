import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import 'group_list_widget.dart';

class GroupListPage extends ConsumerWidget with GroupListWidget {
  GroupListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(title: "Groups"),
      floatingActionButton:  FloatingActionButtonWidget(),
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
