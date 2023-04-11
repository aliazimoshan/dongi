import 'package:dongi/constants/font_config.dart';
import 'package:flutter/material.dart';
import '../../constants/color_config.dart';

class FloatingActionButtonWidget extends Container {
  final String title;
  final void Function()? onPressed;
  FloatingActionButtonWidget({
    super.height = 48,
    super.width = 48,
    super.key,
    required this.title,
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
            Icon(Icons.add, color: ColorConfig.secondary, size: 20),
            const SizedBox(height: 2),
            Text(
              title,
              style:
                  FontConfig.overline().copyWith(color: ColorConfig.secondary),
            ),
          ],
        ),
      );
}
