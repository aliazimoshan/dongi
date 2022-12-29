import 'package:dongi/constants/font_config.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_field/custom_text_field.dart';

class SignUpWidget {
  /// *----- title
  title() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'data',
            style: FontConfig.h5(),
          ),
          Text(
            'data',
            style: FontConfig.button(),
          ),
        ],
      );

  /// *----- form
  form() => Column(
        children: [
          CustomTextField(hintText: 'name'),
          const SizedBox(height: 10),
          CustomTextField(hintText: 'phone number'),
          const SizedBox(height: 10),
          CustomTextField(hintText: 'password'),
        ],
      );

      
}
