import 'package:dongi/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/appbar/sliver_appbar.dart';
import 'expense_review_widget.dart';

class ExpenseReviewPage extends ConsumerWidget with ExpenseReviewWidget {
  const ExpenseReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(title: const Text("Super Market"), elevation: 0),
      body: SliverAppBarWidget(
        appbarTitle: userInfoRow(),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            expenseInfo(),
            memberList(),
          ],
        ),
      ),
    );
  }
}
