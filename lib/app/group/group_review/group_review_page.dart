import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import 'group_review_widget.dart';

class GroupReviewPage extends ConsumerWidget with GroupReviewWidget {
  const GroupReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    "Group Name",
                    style: FontConfig.h5().copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConfig.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: ListView(
                children: [
                  Column(
                    children: [
                      groupInfo(),
                      friendsList(),
                      categoriesList(),
                      expensesList(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
