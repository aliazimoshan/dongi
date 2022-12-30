import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/color_config.dart';
import '../../constants/content/sign_up_contents.dart';
import '../../constants/font_config.dart';
import '../../widgets/button/button.dart';
import '../../widgets/text_field/custom_text_field.dart';

class SignUpWidget {
  /// * ----- title
  title() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SignUpContent.title,
            style: FontConfig.h5(),
          ),
          Text(
            SignUpContent.subTitle,
            style: FontConfig.body2(),
          ),
          const SizedBox(height: 20),
        ],
      );

  /// * ----- form
  form() => Column(
        children: [
          CustomTextField(hintText: 'name'),
          const SizedBox(height: 10),
          CustomTextField(hintText: 'phone number'),
          const SizedBox(height: 10),
          CustomTextField(hintText: 'password'),
          const SizedBox(height: 20)
        ],
      );

  /// * ----- action buttons
  actionButton() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(child: ButtonWidget(title: 'Sign Up', onPressed: () {})),
            const SizedBox(width: 10),
            _googleButton(),
          ],
        ),
      );

  /// * ----- changeActionButton
  changeActionButton() => Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              SignUpContent.changeAction,
              style: FontConfig.h6(),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Text(
                'Sign In',
                style: FontConfig.h6().copyWith(
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      );

  /// * ----- google button
  _googleButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: ColorConfig.primarySwatch,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SvgPicture.asset('assets/svg/google_icon.svg'),
        ),
      ),
    );
  }
}
