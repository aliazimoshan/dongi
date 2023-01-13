import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/category/category_widget.dart';
import '../../../widgets/friends/friend.dart';

class BoxReviewWidget {
  /// * ----- total expense
  totalExpense() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
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
              Column(
                children: [
                  FriendWidget.add(),
                  const SizedBox(height: 5),
                  Text("Add New", style: FontConfig.overline()),
                ],
              ),
              const SizedBox(width: 10),
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
                itemBuilder: (context, i) => Row(
                  children: [
                    CategoryWidget(
                      name: 'category name',
                      balance: '210,000',
                    ),
                    const SizedBox(width: 10),
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
            itemBuilder: (context, i) => Column(
              children: const [
                ListTileCard(
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
}
