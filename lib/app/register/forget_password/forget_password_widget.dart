import 'package:flutter/material.dart';

import '../../../constants/color_config.dart';
import '../../../constants/content/register/forget_password_contents.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/text_field/text_field.dart';

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
  form() => const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: TextFieldWidget(hintText: 'phone number'),
      );

  /// * ----- action buttons
  actionButton() => ButtonWidget(
        onPressed: () {},
        title: 'Next',
        textColor: ColorConfig.secondary,
      );
}
