import 'package:dongi/app/register/auth_controller/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/content/register/sign_up_contents.dart';
import '../../../constants/font_config.dart';
import '../../../core/validation.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/text_field/text_field.dart';

class SignUpWidget {
  /// * ----- body
  signupBody({required List<Widget> children}) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 30, 50, 50),
        decoration: BoxDecoration(
          color: ColorConfig.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  /// * ----- title
  title() {
    return Column(
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
  }

  /// * ----- form
  form({
    required TextEditingController username,
    required TextEditingController email,
    required TextEditingController password,
    required GlobalKey<FormState> formKey,
    required WidgetRef ref,
  }) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFieldWidget(
            controller: username,
            hintText: 'username',
            validator:
                ref.read(formValidatorProvider.notifier).validateUsername,
          ),
          const SizedBox(height: 10),
          TextFieldWidget(
            controller: email,
            hintText: 'email',
            validator: ref.read(formValidatorProvider.notifier).validateEmail,
          ),
          const SizedBox(height: 10),
          TextFieldWidget(
            controller: password,
            hintText: 'password',
            obscureText: true,
            //validator:
            //    ref.read(formValidatorProvider.notifier).validatePassword,
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  /// * ----- action buttons
  actionButton({
    required BuildContext context,
    required WidgetRef ref,
    required TextEditingController username,
    required TextEditingController email,
    required TextEditingController password,
    required GlobalKey<FormState> formKey,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
                title: 'Sign Up',
                isLoading: ref.watch(authControllerProvider),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(authControllerProvider.notifier).signUp(
                          context: context,
                          userName: username.text,
                          email: email.text,
                          password: password.text,
                        );
                  }
                }),
          ),
          const SizedBox(width: 10),
          _googleButton(),
        ],
      ),
    );
  }

  /// * ----- changeActionButton
  changeActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          SignUpContent.changeAction,
          style: FontConfig.body1(),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => context.go(RouteName.signin),
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
