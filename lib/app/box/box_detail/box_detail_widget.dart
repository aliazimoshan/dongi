import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../core/utils.dart';
import '../../../models/box_model.dart';
import '../../../models/expense_model.dart';
import '../../../models/group_model.dart';
import '../../../models/user_model.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/card/category_card.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/list_tile/list_tile_card.dart';
import '../../../widgets/loading/loading.dart';
import '../../../widgets/long_press_menu/long_press_menu.dart';
import '../../../extensions/date_extension.dart';
import '../../expense/controller/expense_controller.dart';
import '../controller/box_controller.dart';

class TotalExpenseBoxDetail extends ConsumerWidget {
  final num total;
  const TotalExpenseBoxDetail(this.total, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorConfig.baseGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'total expense',
                    style: FontConfig.body2()
                        .copyWith(color: ColorConfig.pureWhite),
                  ),
                  Text(
                    '\$$total',
                    style:
                        FontConfig.h6().copyWith(color: ColorConfig.pureWhite),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReviewBodyBoxDetail extends ConsumerWidget {
  final List<Widget> children;
  const ReviewBodyBoxDetail(this.children, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConfig.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}

class FriendListBoxDetail extends ConsumerWidget {
  final List<String> userIds;
  const FriendListBoxDetail({required this.userIds, super.key});

  friendItem(UserModel user) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          FriendWidget(image: user.profileImage),
          const SizedBox(height: 5),
          Text(user.userName, style: FontConfig.overline()),
        ],
      ),
    );
  }

  addFriendCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: [
          FriendWidget.add(),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Add",
                style: FontConfig.caption(),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(getUsersInBoxProvider(userIds));

    return users.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorTextWidget(error),
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 10),
            child: Text(
              'Friends',
              style: FontConfig.body1(),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 11),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) => friendItem(data[index]),
                ),
                //const SizedBox(width: 6),
                addFriendCard(),
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class CategoryListBoxDetail extends ConsumerWidget {
  const CategoryListBoxDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
          child: Text(
            'Categories',
            style: FontConfig.body1(),
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) => const Row(
                  children: [
                    CategoryCardWidget(
                      name: 'category name',
                      balance: '210,000',
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpenseListBoxDetail extends ConsumerWidget {
  final BoxModel boxModel;
  final GroupModel groupModel;
  const ExpenseListBoxDetail({
    super.key,
    required this.boxModel,
    required this.groupModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(getExpensesInBoxProvider(boxModel.id!));

    // by using listen we are not gonna rebuild our app
    ref.listen<ExpenseState>(
      expenseNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () => ref.refresh(getExpensesInBoxProvider(boxModel.id!)),
          error: (message) => showSnackBar(context, message),
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expenses',
            style: FontConfig.body1(),
          ),
          const SizedBox(height: 10),
          expenses.when(
            skipLoadingOnRefresh: false,
            loading: () => const LoadingWidget(),
            error: (error, stackTrace) => ErrorTextWidget(error),
            data: (data) {
              return SlidableAutoCloseBehavior(
                closeWhenOpened: true,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ExpenseCardItem(
                      expenseModel: data[index],
                      boxModel: boxModel,
                      groupModel: groupModel,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ExpenseCardItem extends ConsumerWidget {
  final ExpenseModel expenseModel;
  final BoxModel boxModel;
  final GroupModel groupModel;
  const ExpenseCardItem({
    super.key,
    required this.expenseModel,
    required this.boxModel,
    required this.groupModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey key = GlobalKey();

    deleteExpense() async {
      await ref
          .read(expenseNotifierProvider.notifier)
          .deleteExpense(expenseModel: expenseModel, boxModel: boxModel);
      if (context.mounted) {
        showSnackBar(context, "Expense deleted successfully!!");
      }
      return ref.refresh(getBoxDetailProvider(boxModel.id!));
    }

    //    List<CupertinoContextMenuAction> menuItems = [
    //  CupertinoContextMenuAction(
    //    child: const Text('Edit'),
    //    onPressed: () => context.push(
    //      RouteName.updateExpense,
    //      extra: {"expenseModel": expenseModel},
    //    ),
    //  ),
    //  CupertinoContextMenuAction(
    //    onPressed: deleteExpense,
    //    child: const Text('Delete'),
    //  ),
    //];

    List<PopupMenuEntry> menuItems = [
      PopupMenuItem(
        child: const Text('Edit'),
        onTap: () => context.push(
          RouteName.updateExpense,
          extra: {
            "expenseModel": expenseModel,
            "boxModel": boxModel,
            "groupModel": groupModel,
          },
        ),
      ),
      PopupMenuItem(
        onTap: deleteExpense,
        child: const Text('Delete'),
      ),
    ];

    return Column(
      children: [
        Slidable(
          key: key,
          startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            //dismissible: DismissiblePane(
            //  onDismissed: () => context.push(
            //    RouteName.updateExpense,
            //    extra: {
            //      "expenseModel": expenseModel,
            //    },
            //  ),
            //),
            children: [
              SlidableAction(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                onPressed: (context) => context.push(
                  RouteName.updateExpense,
                  extra: {
                    "expenseModel": expenseModel,
                    "boxModel": boxModel,
                    "groupModel": groupModel,
                  },
                ),
                backgroundColor: const Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              onDismissed: deleteExpense,
              //confirmDismiss: () async {
              //  return await showDialog(
              //    context: context,
              //    builder: (context) {
              //      return AlertDialog(
              //        title: Text("Are you sure?"),
              //        actions: [],
              //      );
              //    },
              //  );
              //},
            ),
            children: [
              SlidableAction(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                onPressed: (context) => deleteExpense(),
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: LongPressMenuWidget(
            items: menuItems,
            onTap: () => context.push(
              RouteName.expenseDetail,
              extra: {"expenseId": expenseModel.id},
            ),
            child: ListTileCard(
              titleString: expenseModel.title,
              trailing: Text("\$${expenseModel.cost}"),
              visualDensity: const VisualDensity(vertical: -2),
              subtitleString: expenseModel.createdAt!.toTimeAgo(),
              //subtitleString: "subtitle",
              //headerString: "header",
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
