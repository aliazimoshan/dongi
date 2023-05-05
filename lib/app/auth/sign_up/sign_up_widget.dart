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
import '../controller/sign_up_controller.dart';

class SignUpBody extends StatelessWidget {
  final List<Widget> children;
  const SignUpBody({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
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
}

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class SignUpForm extends ConsumerWidget {
  final TextEditingController username;
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;
  const SignUpForm({
    super.key,
    required this.username,
    required this.email,
    required this.password,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}

class SignUpAction extends ConsumerWidget {
  final TextEditingController username;
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;
  const SignUpAction({
    required this.username,
    required this.email,
    required this.password,
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
                title: 'Sign Up',
                isLoading: ref.watch(signUpNotifierProvider).maybeWhen(
                      loading: (isGoogle) => true,
                      orElse: () => false,
                    ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await ref.read(signUpNotifierProvider.notifier).signUp(
                          ref: ref,
                          userName: username.text,
                          email: email.text,
                          password: password.text,
                        );
                  }
                }),
          ),
          const SizedBox(width: 10),

          //* Google Button
          InkWell(
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
          ),
        ],
      ),
    );
  }
}

class SignUpChangeAction extends ConsumerWidget {
  const SignUpChangeAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
