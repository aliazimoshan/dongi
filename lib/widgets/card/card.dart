import 'package:dongi/constants/color_config.dart';
import 'package:flutter/material.dart';

//class CardWidget extends Card {
//  final EdgeInsets? padding;
//  final Color? borderColor;
//  final Color? backColor;
//  final void Function()? onTap;
//  const CardWidget({
//    super.key,
//    super.child,
//    super.margin = EdgeInsets.zero,
//    super.color,
//    this.padding,
//    this.borderColor,
//    this.backColor,
//    this.onTap,
//  });

//  @override
//  Color? get color => backColor ?? ColorConfig.grey;

//  @override
//  double? get elevation => 0;

//  @override
//  ShapeBorder? get shape => ;

//  @override
//  Widget? get child =>
//}

class CardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color? backColor;
  final void Function()? onTap;
  const CardWidget({
    super.key,
    required this.child,
    this.padding,
    this.borderColor,
    this.backColor,
    this.onTap,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        elevation: 0,
        color: backColor ?? ColorConfig.grey,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(10),
          child: child,
        ),
      ),
    );
  }
}
