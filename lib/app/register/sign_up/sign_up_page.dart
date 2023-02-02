import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'sign_up_widget.dart';

class SignUpPage extends HookConsumerWidget with SignUpWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          signupBody(
            children: [
              title(),
              form(
                username: usernameController,
                email: emailController,
                password: passwordController,
              ),
              actionButton(
                context: context,
                ref: ref,
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text,
              ),
              changeActionButton(),
            ],
          )
        ],
      ),
    );
  }
}
