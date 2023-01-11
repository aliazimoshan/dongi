import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/floating_action_button/floating_action_button_widget.dart';
import './box_review_widget.dart';

class BoxReviewPage extends ConsumerWidget with BoxReviewWidget {
  const BoxReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              alignment: Alignment.bottomLeft,
              child: totalExpense(),
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
      floatingActionButton: const FloatingActionButtonWidget(),
    );
  }
}
