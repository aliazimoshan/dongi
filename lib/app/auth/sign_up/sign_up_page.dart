import 'package:dongi/app/auth/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../core/utils.dart';
import '../../../router/router_notifier.dart';
import 'sign_up_widget.dart';

class SignUpPage extends HookConsumerWidget {
  SignUpPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// by using listen we are not gonna rebuild our app
    ref.listen<SignUpState>(
      signUpNotifierProvider,
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
          SignUpBody(
            children: [
              const SignUpTitle(),
              SignUpForm(
                formKey: _formKey,
                username: usernameController,
                email: emailController,
                password: passwordController,
              ),
              SignUpAction(
                username: usernameController,
                email: emailController,
                password: passwordController,
                formKey: _formKey,
              ),
              const SignUpChangeAction(),
            ],
          )
        ],
      ),
    );
  }
}
