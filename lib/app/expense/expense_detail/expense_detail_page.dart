import 'package:dongi/app/expense/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../core/utils.dart';
import '../../../widgets/appbar/sliver_appbar.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/loading/loading.dart';
import 'expense_detail_widget.dart';

class ExpenseDetailPage extends ConsumerWidget {
  final String expenseId;
  const ExpenseDetailPage({super.key, required this.expenseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseDetail = ref.watch(getExpensesDetailProvider(expenseId));

    //by using listen we are not gonna rebuild our app
    ref.listen<ExpenseState>(
      expenseNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () => ref.refresh(getExpensesDetailProvider(expenseId)),
          error: (message) => showSnackBar(context, message),
        );
      },
    );

    return Scaffold(
      backgroundColor: ColorConfig.white,
      body: expenseDetail.when(
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => ErrorTextWidget(error),
        data: (data) {
          return SliverAppBarWidget(
            appbarTitle: UserInfoExpenseDetail(creatorId: data.creatorId),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                InfoExpenseDetail(expenseModel: data),
                MemberListExpenseDetail(members: data.expenseUsers),
              ],
            ),
          );
        },
      ),
    );
  }
}
