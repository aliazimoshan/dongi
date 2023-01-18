import 'package:flutter/material.dart';

class CheckboxWidget extends Checkbox {
  const CheckboxWidget({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  OutlinedBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      );

  @override
  BorderSide? get side => MaterialStateBorderSide.resolveWith(
        (states) => const BorderSide(width: 1.0, color: Colors.white),
      );
}
