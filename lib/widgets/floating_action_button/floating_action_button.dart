import 'package:dongi/constants/font_config.dart';
import 'package:flutter/material.dart';
import '../../constants/color_config.dart';

class FloatingActionButtonWidget extends Container {
  final void Function()? onPressed;
  FloatingActionButtonWidget({
    super.height = 48,
    super.width = 48,
    super.key,
    this.onPressed,
  });

  @override
  Decoration? get decoration => BoxDecoration(
        color: ColorConfig.primarySwatch,
        borderRadius: BorderRadius.circular(20),
      );

  @override
  Widget? get child => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              color: ColorConfig.secondary,
            ),
            const SizedBox(height: 2),
            Text(
              'data',
              style:
                  FontConfig.overline().copyWith(color: ColorConfig.secondary),
            ),
          ],
        ),
      );
}
