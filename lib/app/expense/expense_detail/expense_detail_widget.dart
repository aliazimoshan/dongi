import 'package:dongi/widgets/card/grey_card.dart';
import 'package:dongi/widgets/list_tile/list_tile.dart';
import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/friends/friend.dart';

class UserInfoExpenseDetail extends ConsumerWidget {
  const UserInfoExpenseDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTileWidget(
          contentPadding: const EdgeInsets.only(right: 10),
          headerString: "Created By",
          titleString: "Lham",
          titleStringStyle: FontConfig.body2().copyWith(
            color: ColorConfig.pureWhite,
          ),
          headerStringStyle: FontConfig.overline().copyWith(
            color: ColorConfig.pureWhite.withOpacity(0.25),
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
  }
}

class BoxReviewExpenseDetail extends ConsumerWidget {
  final List<Widget> children;
  const BoxReviewExpenseDetail(this.children, {super.key});

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
            Column(children: children),
          ],
        ),
      ),
    );
  }
}

class InfoExpenseDetail extends ConsumerWidget {
  const InfoExpenseDetail({super.key});

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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          infoCard("Total Balance", "\$200"),
          const SizedBox(width: 10),
          infoCard("Date", "Nov 20, 2022"),
          const SizedBox(width: 10),
          infoCard("Split By", "4"),
        ],
      ),
    );
  }
}

class MemberListExpenseDetail extends ConsumerWidget {
  const MemberListExpenseDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTileCard(
              visualDensity: const VisualDensity(vertical: 3),
              titleString: 'Member name',
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
  }
}
