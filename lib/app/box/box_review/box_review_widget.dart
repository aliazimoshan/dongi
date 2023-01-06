import 'package:flutter/material.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/category/category_widget.dart';
import '../../../widgets/friends/friends_widget.dart';
import '../../../widgets/list_tile/custom_list_tile.dart';

class BoxReviewWidget {
  /// * ----- total expense
  totalExpense() => SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  style:
                      FontConfig.body2().copyWith(color: ColorConfig.pureWhite),
                ),
                Text(
                  '\$7,540.00',
                  style: FontConfig.h5().copyWith(color: ColorConfig.pureWhite),
                ),
              ],
            ),
          ],
        ),
      );

  /// * ----- friends list
  friendsList() => Column(
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
                const SizedBox(width: 16),
                FriendWidget(),
                const SizedBox(width: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, i) => Row(
                    children: [
                      FriendWidget(),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      );

  /// * ----- friends list
  categoriesList() => Column(
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
                  itemBuilder: (ctx, i) => Row(
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
                children: [
                  CustomListTile(
                    title: 'data',
                    price: '0',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      );
}
