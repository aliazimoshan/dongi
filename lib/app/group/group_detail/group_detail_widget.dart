import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../core/utils.dart';
import '../../../models/group_model.dart';
import '../../../models/user_model.dart';
import '../../../widgets/card/box_card.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/loading/loading.dart';
import '../../box/controller/box_controller.dart';
import '../controller/group_controller.dart';

class GroupDetailTitle extends StatelessWidget {
  final String groupName;
  const GroupDetailTitle({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Text(
            groupName,
            style: FontConfig.h6().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class GroupDetailReviewBody extends StatelessWidget {
  final List<Widget> children;
  const GroupDetailReviewBody({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
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

class GroupDetailInfo extends StatelessWidget {
  final GroupModel groupModel;
  const GroupDetailInfo({super.key, required this.groupModel});

  groupInfoCard(String title, String subtitle, IconData icon) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: CardWidget(
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Group Icon
              Icon(icon),
              const Spacer(),
              Text(
                title,
                style: FontConfig.caption(),
              ),
              Text(
                subtitle,
                style: FontConfig.body2().copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 0, 11, 16),
      child: Row(
        children: [
          groupInfoCard(
            "Total Balance",
            "\$${groupModel.totalBalance}",
            Icons.monetization_on_rounded,
          ),
          groupInfoCard(
            "Boxes",
            groupModel.boxIds.length.toString(),
            Icons.group,
          ),
          groupInfoCard(
            "Members",
            groupModel.groupUsers.length.toString(),
            Icons.account_box,
          ),
        ],
      ),
    );
  }
}

class GroupDetailFriendList extends ConsumerWidget {
  final List<String> userIds;
  const GroupDetailFriendList({super.key, required this.userIds});

  friendCard(UserModel user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: [
          FriendWidget(image: user.profileImage),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                user.userName,
                style: FontConfig.caption(),
              )
            ],
          )
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
    final groupDetail = ref.watch(getUsersInGroupProvider(userIds));

    return groupDetail.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorTextWidget(error),
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 16, 0, 10),
            child: Text(
              'Friends',
              style: FontConfig.body1(),
            ),
          ),
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                const SizedBox(width: 11),
                ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => friendCard(data[index]),
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                addFriendCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GroupDetailBoxGrid extends ConsumerWidget {
  final GroupModel groupModel;
  const GroupDetailBoxGrid({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxesInGroup = ref.watch(getBoxesInGroupProvider(groupModel.id!));

    ref.listen<BoxState>(
      boxNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () => ref.refresh(getBoxesInGroupProvider(groupModel.id!)),
          error: (message) => showSnackBar(context, message),
        );
      },
    );

    return boxesInGroup.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorTextWidget(error),
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 0, 0, 10),
            child: Text(
              'Boxes',
              style: FontConfig.body1(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, i) => BoxCardWidget(
                boxModel: data[i],
                groupModel: groupModel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
