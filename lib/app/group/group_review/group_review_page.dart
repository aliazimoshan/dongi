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
      body: Column(
        children: [
          /// * group name // header
          groupName("group name"),

          /// * group body // body
          groupReviewBody(
            children: [
              groupInfo(),
              friendsList(),
              categoriesList(),
              //expensesList(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonWidget(),
    );
  }
}
