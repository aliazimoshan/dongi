import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../core/utils.dart';
import '../../../router/router_notifier.dart';
import '../controller/sign_in_controller.dart';
import 'sign_in_widget.dart';

class SignInPage extends HookConsumerWidget {
  SignInPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = useTextEditingController();
    TextEditingController passwordController = useTextEditingController();

    /// by using listen we are not gonna rebuild our app
    ref.listen<SignInState>(
      signInNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () {
            context.go(RouteName.home);
          },
          error: (message) {
            showSnackBar(context, message);
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: ColorConfig.background,
      body: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          SingleChildScrollView(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignInTitle(),
                  SignInForm(
                    formKey: _formKey,
                    email: emailController,
                    password: passwordController,
                  ),
                  SignInActionButton(
                    formKey: _formKey,
                    email: emailController,
                    password: passwordController,
                  ),
                  const SignInChangeActionButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
