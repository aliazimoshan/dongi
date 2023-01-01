import 'package:flutter/material.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';

class CategoryWidget extends Container {
  final String name;
  final String balance;
  CategoryWidget({required this.name, required this.balance, super.key})
      : super(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: 130,
        );
  @override
  Decoration? get decoration => BoxDecoration(
        color: ColorConfig.pureWhite,
        borderRadius: BorderRadius.circular(5),
      );
  @override
  Widget? get child => Column(
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
          const SizedBox(height: 15),
          Text(
            name,
            style: FontConfig.overline(),
          ),
          Text(
            '\$$balance',
            style: FontConfig.body2().copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      );
}
