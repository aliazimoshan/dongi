import 'package:flutter/material.dart';
import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import 'card.dart';

class BoxCardWidget extends CardWidget {
  const BoxCardWidget({super.key});

  @override
  EdgeInsetsGeometry? get margin => const EdgeInsets.fromLTRB(5, 0, 5, 0);

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: ColorConfig.darkGrey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(child: Text("Box Name", style: FontConfig.body2())),
                  Icon(
                    Icons.more_vert,
                    color: ColorConfig.primarySwatch,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text("Total bill", style: FontConfig.overline()),
              Text(
                '\$140.0',
                style: FontConfig.body2().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text("Split to", style: FontConfig.overline()),
              Text(
                '2',
                style: FontConfig.body2().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
}
