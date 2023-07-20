import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/appbar/sliver_appbar.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import '../../../widgets/loading/loading.dart';
import '../controller/box_controller.dart';
import './box_detail_widget.dart';

class BoxDetailPage extends ConsumerWidget {
  final String boxId;
  final String groupId;
  const BoxDetailPage({
    super.key,
    required this.boxId,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxDetail = ref.watch(getBoxDetailProvider(boxId));

    //by using listen we are not gonna rebuild our app
    ref.listen<BoxState>(
      boxNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () => ref.refresh(getBoxesInGroupProvider(groupId)),
          error: (message) => showSnackBar(context, message),
        );
      },
    );

    //this section moved to ExpenseListBoxDetail
    //ref.listen<ExpenseState>(
    //  expenseNotifierProvider,
    //  (previous, next) {
    //    next.whenOrNull(
    //      loaded: () => ref.refresh(getExpensesInBoxProvider(boxId)),
    //      error: (message) => showSnackBar(context, message),
    //    );
    //  },
    //);

    return Scaffold(
      //backgroundColor: ColorConfig.primarySwatch,
      //appBar: AppBar(elevation: 0),
      body: boxDetail.when(
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => ErrorTextWidget(error),
        data: (data) {
          //print(data.boxUser);
          return SliverAppBarWidget(
            image: data.image,
            //collapsedHeight: 120,
            height: 200,
            appbarTitle: TotalExpenseBoxDetail(data.total!),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FriendListBoxDetail(userIds: data.boxUsers),
                //TODO: Think about the structure
                const CategoryListBoxDetail(),
                ExpenseListBoxDetail(boxId),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FABWidget(
        title: 'Expense',
        onPressed: () => context.push(
          RouteName.createExpense,
          extra: {"boxId": boxId, "groupId": groupId},
        ),
      ),
    );
  }
}
