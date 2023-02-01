import 'package:dongi/app/register/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/content/register/sign_up_contents.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/text_field/text_field.dart';

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
        children: const [
          TextFieldWidget(hintText: 'name'),
          SizedBox(height: 10),
          TextFieldWidget(hintText: 'phone number'),
          SizedBox(height: 10),
          TextFieldWidget(hintText: 'password'),
          SizedBox(height: 20)
        ],
      );

  /// * ----- action buttons
  actionButton(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              onPressed: () => ref.read(authControllerProvider.notifier).signUp(
                    email: "azimoshan@gmail.com",
                    password: "123456789",
                    userName: "aliazim",
                    context: context,
                  ),
              title: 'Sign Up',
              textColor: ColorConfig.secondary,
            ),
          ),
          const SizedBox(width: 10),
          _googleButton(),
        ],
      ),
    );
  }

  /// * ----- changeActionButton
  changeActionButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            SignUpContent.changeAction,
            style: FontConfig.body1(),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: Text(
              'Sign In',
              style: FontConfig.body1().copyWith(
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
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
          child: SvgPicture.asset(
            'assets/svg/google_icon.svg',
            color: ColorConfig.secondary,
          ),
        ),
      ),
    );
  }
}
