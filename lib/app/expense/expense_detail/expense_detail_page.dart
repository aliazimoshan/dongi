import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/appbar/sliver_appbar.dart';
import 'expense_detail_widget.dart';

class ExpenseDetailPage extends ConsumerWidget {
  const ExpenseDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.white,
      //appBar: AppBar(title: const Text("Super Market"), elevation: 0),
      body: SliverAppBarWidget(
        appbarTitle: const UserInfoExpenseDetail(),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            InfoExpenseDetail(),
            MemberListExpenseDetail(),
          ],
        ),
      ),
    );
  }
}
