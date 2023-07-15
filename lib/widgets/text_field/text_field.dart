import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';

class TextFieldWidget extends HookWidget {
  final String hintText;
  final Color? fillColor;
  final int maxLines;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String? value)? validator;
  final String? Function(String? value)? onChanged;
  final List<TextInputFormatter> inputFormatters;
  const TextFieldWidget({
    required this.hintText,
    this.fillColor,
    super.key,
    this.maxLines = 1,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.inputFormatters = const [],
  });

  @override
  Widget build(BuildContext context) {
    final toggle = useState(false);
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      maxLines: maxLines,
      controller: controller,
      obscureText: obscureText && !toggle.value,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? ColorConfig.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: FontConfig.body2().copyWith(
          color: ColorConfig.midnight.withOpacity(0.5),
        ),
        suffixIcon: obscureText
            ? InkWell(
                child: Icon(
                    toggle.value ? Icons.visibility : Icons.visibility_off),
                onTap: () => toggle.value = !toggle.value,
              )
            : null,
      ),
    );
  }
}
