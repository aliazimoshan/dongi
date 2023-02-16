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
  /// * body
  signinBody({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 50),
      decoration: BoxDecoration(
        color: ColorConfig.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  /// * ----- title
  title() {
    return Column(
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
  }

  /// * ----- form
  form({
    required TextEditingController email,
    required TextEditingController password,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFieldWidget(controller: email, hintText: 'email'),
        const SizedBox(height: 10),
        TextFieldWidget(controller: password, hintText: 'password'),
        const SizedBox(height: 10),
        _forgetPassword(),
        const SizedBox(height: 20)
      ],
    );
  }

  /// * ----- action buttons
  actionButton({
    required BuildContext context,
    required WidgetRef ref,
    required TextEditingController email,
    required TextEditingController password,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              title: "Sign in",
              isLoading: ref.watch(authControllerProvider),
              onPressed: () => ref.read(authControllerProvider.notifier).login(
                    context: context,
                    email: email.text,
                    password: password.text,
                  ),
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
