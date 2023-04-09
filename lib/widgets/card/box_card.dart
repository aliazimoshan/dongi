import 'package:dongi/models/box_model.dart';
import 'package:flutter/material.dart';
import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import 'card.dart';

class BoxCardWidget extends CardWidget {
  final BoxModel box;
  const BoxCardWidget(this.box, {super.key});

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
                      image: box.image != null
                          ? DecorationImage(image: NetworkImage(box.image!))
                          : null,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(child: Text(box.title, style: FontConfig.body2())),
                  Icon(
                    Icons.more_vert,
                    color: ColorConfig.primarySwatch,
                  ),
                ],
              ),
              const Spacer(),
              Text("Total bill", style: FontConfig.overline()),
              Text(
                '\$140.0',
                style: FontConfig.body2().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text("Split to", style: FontConfig.overline()),
              Text(
                box.members.length.toString(),
                style: FontConfig.body2().copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
