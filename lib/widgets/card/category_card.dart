import 'package:flutter/material.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import 'card.dart';

class CategoryCardWidget extends StatelessWidget {
  final String name;
  final String balance;
  const CategoryCardWidget({
    super.key,
    required this.name,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: SizedBox(
        height: 115,
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: ColorConfig.primarySwatch,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.more_vert,
                  color: ColorConfig.primarySwatch,
                ),
              ],
            ),
            const Spacer(),
            Text(
              name,
              style: FontConfig.overline(),
            ),
            const SizedBox(height: 5),
            Text(
              '\$$balance',
              style: FontConfig.body2(),
            ),
          ],
        ),
      ),
    );
  }
}
