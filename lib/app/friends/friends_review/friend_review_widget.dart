import 'package:flutter/material.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../constants/size_config.dart';
import '../../../widgets/list_tile/list_tile_card.dart';

class FriendReviewWidget {
  /// * ----- total expense
  friendName(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Text(
          //   'total expense',
          //   style: FontConfig.caption().copyWith(color: ColorConfig.pureWhite),
          // ),
          // const SizedBox(height: 5),
          Text(
            'Friend Name',
            // '\$7,540.00',
            style: FontConfig.h5().copyWith(
              color: ColorConfig.pureWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  /// * ----- review section
  review() {
    /// * review card
    reviewCard() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorConfig.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: ColorConfig.primarySwatch,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'data',
                style: FontConfig.overline().copyWith(
                  color: ColorConfig.midnight.withOpacity(0.5),
                ),
              ),
              Text(
                'data',
                style: FontConfig.body2(),
              ),
            ],
          ),
        ),
      );
    }

    /// * ----- review widget
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Row(
        children: [
          reviewCard(),
          const SizedBox(width: 10),
          reviewCard(),
          const SizedBox(width: 10),
          reviewCard(),
        ],
      ),
    );
  }

  /// * ----- expense list
  expensesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(
              'Expenses',
              style: FontConfig.body1(),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, i) => Column(
              children: [
                ListTileCard(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorConfig.primarySwatch,
                      shape: BoxShape.circle,
                    ),
                  ),
                  trailing: Text(
                    '\$53',
                    style: FontConfig.body2(),
                  ),
                  headerString: 'you owe',
                  titleString: 'friend name',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
