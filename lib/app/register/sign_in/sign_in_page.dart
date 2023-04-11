import 'package:dongi/app/register/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import './sign_in_widget.dart';

class SignInPage extends HookConsumerWidget {
  SignInPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = useTextEditingController();
    TextEditingController passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: ColorConfig.background,
      body: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Container(
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
              children: [
                const SignInTitle(),
                SignInForm(
                  formKey: _formKey,
                  email: emailController,
                  password: passwordController,
                ),
                SignInActionButton(
                  isLoading: ref.watch(authControllerProvider),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      ref.read(authControllerProvider.notifier).signIn(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    }
                  },
                ),
                const SignInChangeActionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
