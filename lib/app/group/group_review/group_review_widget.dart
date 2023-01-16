import 'package:flutter/material.dart';
import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/card/box_card.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/friends/friend.dart';

class GroupReviewWidget {
  ///* group name
  groupName(String groupName) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Text(
              "Group Name",
              style: FontConfig.h5().copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  groupReviewBody({required List<Widget> children}) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConfig.background,
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

  // * group info
  groupInfo() {
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 16, 11, 16),
      child: Row(
        children: [
          groupInfoCard(
              "Total Balance", "\$200.00", Icons.monetization_on_rounded),
          groupInfoCard("Boxes", "5", Icons.group),
          groupInfoCard("Members", "5", Icons.account_box),
        ],
      ),
    );
  }

  /// * ----- friends list
  friendsList() {
    friendCard() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(
          children: [
            FriendWidget(),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "Name",
                  style: FontConfig.caption(),
                )
              ],
            )
          ],
        ),
      );
    }

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
            children: [
              const SizedBox(width: 11),
              friendCard(),
              friendCard(),
              friendCard(),
              friendCard(),
              friendCard(),
              friendCard(),
            ],
          ),
        ),
      ],
    );
  }

  /// * ----- friends list
  categoriesList() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, i) => const BoxCardWidget(),
            ),
          ),
        ],
      );

  /// * ----- expenses list
  //expensesList() => Padding(
  //      padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
  //      child: Column(
  //        crossAxisAlignment: CrossAxisAlignment.start,
  //        children: [
  //          Text(
  //            'Expenses',
  //            style: FontConfig.body1(),
  //          ),
  //          const SizedBox(height: 10),
  //          ListView.builder(
  //            shrinkWrap: true,
  //            physics: const NeverScrollableScrollPhysics(),
  //            itemCount: 5,
  //            itemBuilder: (context, i) => Column(
  //              children: const [
  //                ListTileWidget(
  //                  titleString: 'data',
  //                  trailing: Text("\$53"),
  //                ),
  //                SizedBox(height: 10),
  //              ],
  //            ),
  //          ),
  //        ],
  //      ),
  //    );
}
