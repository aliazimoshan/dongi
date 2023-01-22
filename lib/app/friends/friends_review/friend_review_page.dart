import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/appbar/sliver_appbar.dart';
import './friend_review_widget.dart';

class FriendReviewPage extends HookConsumerWidget with FriendReviewWidget {
  const FriendReviewPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SliverAppBarWidget(
        /// * ----- total expense
        appbarTitle: friendName(context),
        child: ListView(
          children: [
            /// * ----- review
            review(),

            /// * ----- expense list
            expensesList(),
          ],
        ),
      ),
    );
  }
}
