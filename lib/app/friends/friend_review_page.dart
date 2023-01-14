import 'package:dongi/constants/color_config.dart';
import 'package:dongi/constants/font_config.dart';
import 'package:dongi/widgets/appbar/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './friend_review_widget.dart';

class FriendReviewPage extends HookConsumerWidget with FriendReviewWidget {
  const FriendReviewPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(
        title: Text(
          'Friend',
          style: FontConfig.h6().copyWith(color: ColorConfig.pureWhite),
        ),
      ),
      body: SliverAppBarWidget(
        appbarTitle: Text('data'),
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
