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
          /// * Box review header
          totalExpense(),

          /// * Box review body
          boxReviewBody(
            children: [
              friendsList(),
              categoriesList(),
              expensesList(),
            ],
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
    );
  }
}
