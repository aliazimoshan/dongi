import 'package:flutter/material.dart';

import '../../../constants/content/register/forget_password_contents.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/text_field/custom_text_field.dart';


class ForgetPasswordWidget {
  /// * ----- title
  title() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ForgetPasswordContents.title,
            style: FontConfig.h5(),
          ),
          Text(
            ForgetPasswordContents.subTitle,
            style: FontConfig.body2(),
          ),
          const SizedBox(height: 20),
        ],
      );

  /// * ----- form
  form() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomTextField(hintText: 'phone number'),
      );

  /// * ----- action buttons
  actionButton() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ButtonWidget(title: 'Next', onPressed: () {}),
      );
}
