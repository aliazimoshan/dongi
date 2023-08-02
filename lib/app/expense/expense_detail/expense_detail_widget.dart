import 'package:dongi/extensions/date_extension.dart';
import 'package:dongi/models/expense_model.dart';
import 'package:dongi/widgets/card/grey_card.dart';
import 'package:dongi/widgets/list_tile/list_tile.dart';
import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/loading/loading.dart';
import '../../auth/controller/auth_controller.dart';

class UserInfoExpenseDetail extends ConsumerWidget {
  final String creatorId;
  const UserInfoExpenseDetail({super.key, required this.creatorId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creator = ref.watch(getUserData(creatorId));

    return creator.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorTextWidget(error),
      data: (data) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTileWidget(
              contentPadding: const EdgeInsets.fromLTRB(0, 2, 10, 2),
              headerString: "Created By",
              titleString: data.userName,
              titleStringStyle: FontConfig.body1().copyWith(
                color: ColorConfig.pureWhite,
              ),
              headerStringStyle: FontConfig.overline().copyWith(
                color: ColorConfig.pureWhite.withOpacity(0.5),
              ),
              leading: FriendWidget(
                backgroundColor: ColorConfig.grey,
                height: 40,
                width: 40,
              ),
              trailing: Icon(
                Icons.info_outline,
                color: ColorConfig.secondary,
              ),
            ),
          ],
        );
      },
    );
  }
}

//class BoxReviewExpenseDetail extends ConsumerWidget {
//  final List<Widget> children;
//  const BoxReviewExpenseDetail(this.children, {super.key});
//  @override
//  Widget build(BuildContext context, WidgetRef ref) {
//    return Expanded(
//      flex: 3,
//      child: Container(
//        decoration: BoxDecoration(
//          color: ColorConfig.white,
//          borderRadius: const BorderRadius.only(
//            topLeft: Radius.circular(15),
//            topRight: Radius.circular(15),
//          ),
//        ),
//        child: ListView(
//          children: [
//            Column(children: children),
//          ],
//        ),
//      ),
//    );
//  }
//}

class InfoExpenseDetail extends ConsumerWidget {
  final ExpenseModel expenseModel;

  const InfoExpenseDetail({super.key, required this.expenseModel});

  infoCard(String title, String content) {
    return Expanded(
      child: SizedBox(
        height: 90,
        child: GreyCardWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: ColorConfig.primarySwatch,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  //const Spacer(),
                  //Icon(
                  //  Icons.more_vert,
                  //  color: ColorConfig.primarySwatch,
                  //),
                ],
              ),
              const Spacer(),
              Text(
                title,
                style: FontConfig.overline(),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: FontConfig.body2(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        children: [
          infoCard("Cost", expenseModel.cost.toString()),
          const SizedBox(width: 10),
          infoCard("Date", expenseModel.createdAt!.toHumanReadableFormat()),
          const SizedBox(width: 10),
          infoCard("Split By", expenseModel.expenseUsers.length.toString()),
        ],
      ),
    );
  }
}

class MemberListExpenseDetail extends ConsumerWidget {
  final List<String> members;
  const MemberListExpenseDetail({super.key, required this.members});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseMember = ref.watch(getUsersListData(members));

    return expenseMember.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorTextWidget(error),
      data: (data) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ListTileCard(
                  //visualDensity: const VisualDensity(vertical: 3),
                  titleString: data[index].userName,
                  trailing: const Text("\$53"),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConfig.primarySwatch,
                    ),
                  ),
                  //subtitleString: "subtitle",
                  //headerString: "header",
                ),
              );
            },
          ),
        );
      },
    );
  }
}
