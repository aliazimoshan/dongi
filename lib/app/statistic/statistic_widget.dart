import 'package:flutter/material.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import '../../widgets/card/category_card.dart';
import '../../widgets/list_tile/list_tile_card.dart';

class StatisticWidget {
  /// *----- categories
  categories() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Categories',
                style: FontConfig.body1(),
              ),
              const Spacer(),
              Text(
                'show more',
                style: FontConfig.overline().copyWith(
                  color: ColorConfig.primarySwatch.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 115,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(width: 16),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Row(
                    children: const [
                      CategoryCardWidget(
                        name: 'category name',
                        balance: '\$ 210,000',
                      ),
                      SizedBox(width: 10),
                    ],
                  );
                },
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  /// *----- expenses
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
              itemCount: 15,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    ListTileCard(
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ColorConfig.primarySwatch,
                          shape: BoxShape.circle,
                        ),
                      ),
                      titleString: 'expense title',
                      trailing: const Text("\$53"),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
