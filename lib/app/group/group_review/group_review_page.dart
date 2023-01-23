import 'package:dongi/widgets/appbar/sliver_appbar.dart';
import 'package:dongi/widgets/floating_action_button/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import './group_review_widget.dart';

class GroupReviewPage extends ConsumerWidget with GroupReviewWidget {
  const GroupReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(elevation: 0),
      body: SliverAppBarWidget(
        appbarTitle: groupName("group name"),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            groupInfo(),
            friendsList(),
            categoriesList(),
            //expensesList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(),
    );
  }
}
