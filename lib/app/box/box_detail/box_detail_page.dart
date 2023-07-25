import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../../../models/group_model.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/appbar/sliver_appbar.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import '../../../widgets/loading/loading.dart';
import '../controller/box_controller.dart';
import './box_detail_widget.dart';

class BoxDetailPage extends ConsumerWidget {
  final String boxId;
  final GroupModel groupModel;
  const BoxDetailPage({
    super.key,
    required this.boxId,
    required this.groupModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxDetail = ref.watch(getBoxDetailProvider(boxId));

    //by using listen we are not gonna rebuild our app
    ref.listen<BoxState>(
      boxNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () {
            ref.read(getBoxesInGroupProvider(groupModel.id!));
            return ref.refresh(getBoxDetailProvider(boxId));
          },
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

    return boxDetail.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorTextWidget(error),
      data: (data) {
        //print(data.boxUser);
        return Scaffold(
          body: SliverAppBarWidget(
            image: data.image,
            //collapsedHeight: 120,
            height: 200,
            appbarTitle: TotalExpenseBoxDetail(data.total),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FriendListBoxDetail(userIds: data.boxUsers),
                //TODO: Think about the structure
                const CategoryListBoxDetail(),
                ExpenseListBoxDetail(
                  boxModel: data,
                  groupModel: groupModel,
                ),
              ],
            ),
          ),
          floatingActionButton: FABWidget(
            title: 'Expense',
            onPressed: () => context.push(
              RouteName.createExpense,
              extra: {"boxModel": data, "groupModel": groupModel},
            ),
          ),
        );
      },
    );
  }
}
