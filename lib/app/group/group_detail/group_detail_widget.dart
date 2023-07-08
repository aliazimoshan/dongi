import 'package:dongi/models/box_model.dart';
import 'package:dongi/models/group_model.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../models/group_user_model.dart';
import '../../../widgets/card/box_card.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/friends/friend.dart';

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
            style: FontConfig.h6().copyWith(color: Colors.white),
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
            groupModel.box.length.toString(),
            Icons.group,
          ),
          groupInfoCard(
            "Members",
            groupModel.groupUser.length.toString(),
            Icons.account_box,
          ),
        ],
      ),
    );
  }
}

class GroupDetailFriendList extends StatelessWidget {
  final List<String> userIds;
  const GroupDetailFriendList({super.key, required this.userIds});
  friendCard(GroupUserModel user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        children: [
          FriendWidget(image: user.userId.profilePic),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                user.userId.userName,
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
  Widget build(BuildContext context) {
    return Column(
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
                itemCount: users.length,
                itemBuilder: (context, index) => friendCard(users[index]),
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
              addFriendCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class GroupDetailBoxGrid extends StatelessWidget {
  final List<BoxModel> boxList;
  const GroupDetailBoxGrid({super.key, required this.boxList});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: boxList.length,
            itemBuilder: (context, i) => BoxCardWidget(boxList[i]),
          ),
        ),
      ],
    );
  }
}
