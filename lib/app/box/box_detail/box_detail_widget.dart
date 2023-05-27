import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/card/category_card.dart';
import '../../../widgets/friends/friend.dart';

class BoxDetailWidget {
  /// * ----- total expense
  totalExpense() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
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
                      '\$7,540.00',
                      style: FontConfig.h5()
                          .copyWith(color: ColorConfig.pureWhite),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  boxReviewBody({required List<Widget> children}) {
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

  /// * ----- friends list
  friendsList() {
    friendItem() {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            FriendWidget(),
            const SizedBox(height: 5),
            Text("data", style: FontConfig.overline()),
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
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) => friendItem(),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  /// * ----- friends list
  categoriesList() {
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

  /// * ----- expenses list
  expensesList() {
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
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, i) => const Column(
              children: [
                ListTileCard(
                  titleString: 'expense title',
                  trailing: Text("\$53"),
                  //subtitleString: "subtitle",
                  //headerString: "header",
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
