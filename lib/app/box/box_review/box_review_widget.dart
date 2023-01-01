import 'package:flutter/material.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/friends/friends_widget.dart';
import '../../../widgets/list_tile/custom_list_tile.dart';

class BoxReviewWidget {
  /// * ----- friends list
  friendsList() => SizedBox(
        height: 110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: 16),
            FriendsWidget(
              onTap: () {},
              title: 'Add New',
              child: Icon(
                Icons.add,
                color: ColorConfig.pureWhite,
              ),
            ),
            const SizedBox(width: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (ctx, i) => Row(
                children: [
                  FriendsWidget(
                    onTap: () {},
                    title: 'name',
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(width: 6),
          ],
        ),
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
