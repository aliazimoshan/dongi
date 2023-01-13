import 'package:flutter/material.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/card/box_card.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/list_tile/list_tile.dart';

class GroupReviewWidget {
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
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 10),
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
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
            child: Text(
              'Boxes',
              style: FontConfig.body1(),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, i) => const BoxCardWidget(),
                ),
              ],
            ),
          ),
        ],
      );

  /// * ----- expenses list
  expensesList() => Padding(
        padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expenses',
              style: FontConfig.body1(),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (ctx, i) => Column(
                children: const [
                  ListTileWidget(
                    titleString: 'data',
                    trailing: Text("\$53"),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      );
}
