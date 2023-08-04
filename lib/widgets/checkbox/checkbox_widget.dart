import 'package:flutter/material.dart';

class CheckboxWidget extends Checkbox {
  final Color? borderColor;
  const CheckboxWidget({
    super.key,
    required super.value,
    required super.onChanged,
    super.activeColor,
    super.checkColor,
    this.borderColor,
  });

  @override
  OutlinedBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      );

  @override
  BorderSide? get side => MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(width: 1.0, color: borderColor ?? Colors.white),
      );
}
