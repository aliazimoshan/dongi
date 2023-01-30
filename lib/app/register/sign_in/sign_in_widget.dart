import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/content/register/sign_in_contents.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/text_field/text_field.dart';
import '../auth_controller/auth_controller.dart';

class SignInWidget {
  /// * ----- title
  title() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SignInContents.title,
            style: FontConfig.h5(),
          ),
          Text(
            SignInContents.subTitle,
            style: FontConfig.body2(),
          ),
          const SizedBox(height: 20),
        ],
      );

  /// * ----- form
  form() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const TextFieldWidget(hintText: 'phone number'),
          const SizedBox(height: 10),
          const TextFieldWidget(hintText: 'password'),
          const SizedBox(height: 10),
          _forgetPassword(),
          const SizedBox(height: 20)
        ],
      );

  /// * ----- action buttons
  actionButton(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: ButtonWidget(
                onPressed: () =>
                    ref.read(authControllerProvider.notifier).login(
                          email: "azimoshan@gmail.com",
                          password: "123456789",
                          context: context,
                        ),
                textColor: ColorConfig.secondary,
              ),
            ),
            const SizedBox(width: 10),
            _googleButton(),
          ],
        ),
      );

  /// * ----- changeActionButton
  changeActionButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            SignInContents.changeAction,
            style: FontConfig.body1(),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: Text(
              'Sign Up',
              style: FontConfig.body1().copyWith(
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );

  /// * ----- forget password
  _forgetPassword() {
    return InkWell(
      onTap: () {},
      child: Text(
        SignInContents.forgetPassword,
        style: FontConfig.body2().copyWith(),
      ),
    );
  }

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
