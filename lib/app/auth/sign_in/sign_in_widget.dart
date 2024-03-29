import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:dongi/constants/color_config.dart';
import 'package:dongi/constants/content/register/sign_in_contents.dart';
import 'package:dongi/constants/font_config.dart';
import 'package:dongi/core/validation.dart';
import 'package:dongi/widgets/button/button.dart';
import 'package:dongi/widgets/text_field/text_field.dart';

import '../../../router/router_notifier.dart';
import '../controller/sign_in_controller.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class SignInForm extends ConsumerWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;
  const SignInForm({
    Key? key,
    required this.formKey,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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
          const SizedBox(height: 10),
          InkWell(
            onTap: () {},
            child: Text(
              SignInContents.forgetPassword,
              style: FontConfig.body2().copyWith(),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class SignInActionButton extends ConsumerWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;
  const SignInActionButton({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              title: "Sign in",
              isLoading: ref.watch(signInNotifierProvider).maybeWhen(
                    loading: (isGoogle) => true,
                    orElse: () => false,
                  ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ref.read(signInNotifierProvider.notifier).signIn(
                        email: email.text,
                        password: password.text,
                      );
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          const SignInGoogleButton(),
        ],
      ),
    );
  }
}

class SignInGoogleButton extends ConsumerWidget {
  const SignInGoogleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(signInNotifierProvider).maybeWhen(
          loading: (isGoogle) => true,
          orElse: () => false,
        );

    return InkWell(
      onTap: isLoading
          ? null
          : () => ref.read(signInNotifierProvider.notifier).signInWithGoogle(),
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

class SignInChangeActionButton extends StatelessWidget {
  const SignInChangeActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          SignInContents.changeAction,
          style: FontConfig.body1(),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => context.go(RouteName.signup),
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
  }
}
