import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/appbar/appbar.dart';
import 'create_group_widget.dart';

class CreateGroupPage extends ConsumerWidget with CreateGroupWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.background,
      appBar: AppBarWidget(title: "Create Group"),
      body: Column(
        children: [
          groupInfoCard(context),
          addFriendsCard(context),
          const Spacer(),
          createButton(),
        ],
      ),
    );
  }
}
