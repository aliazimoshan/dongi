import 'package:flutter/material.dart';
import '../../constants/color_config.dart';
import '../../constants/font_config.dart';

class CustomListTile extends Container {
  final Widget? icon;
  final String title;
  final String? subTitle;
  final String? price;

  CustomListTile({
    this.icon,
    required this.title,
    this.subTitle,
    this.price,
    super.key,
  }) : super(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        );

  @override
  Decoration? get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorConfig.pureWhite,
      );

  @override
  Widget? get child => Row(
        children: [
          /// * ----- icon
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  icon ?? const SizedBox(),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// * ----- icon
              Text(
                title,
                style: FontConfig.body2(),
              ),

              /// * ----- sub title
              if (subTitle != null)
                Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      subTitle ?? '',
                      style: FontConfig.overline(),
                    ),
                  ],
                ),
            ],
          ),
          const Spacer(),

          /// * ----- price
          price == null ? const Icon(Icons.more_vert) : Text('\$$price'),
        ],
      );
}
