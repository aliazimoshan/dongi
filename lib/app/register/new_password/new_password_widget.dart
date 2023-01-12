import 'package:flutter/material.dart';

import '../../../constants/content/register/new_password_contents.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/text_field/custom_text_field.dart';

class NewPasswordWidget {
  /// * ----- title
  title() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NewPasswordContents.title,
            style: FontConfig.h5(),
          ),
          Text(
            NewPasswordContents.subTitle,
            style: FontConfig.body2(),
          ),
          const SizedBox(height: 20),
        ],
      );

  /// * ----- form
  form() => Column(
        children: const [
          TextFieldWidget(hintText: 'new password'),
          SizedBox(height: 10),
          TextFieldWidget(hintText: 'repeat new password'),
          SizedBox(height: 20)
        ],
      );

  /// * ----- action buttons
  actionButton() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: ButtonWidget(title: 'Save', onPressed: () {}),
      );
}
