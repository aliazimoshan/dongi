import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import 'sign_up_widget.dart';

class SignUpPage extends HookConsumerWidget with SignUpWidget {
  SignUpPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: ColorConfig.background,
      body: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          signupBody(
            children: [
              title(),
              form(
                formKey: _formKey,
                ref: ref,
                username: usernameController,
                email: emailController,
                password: passwordController,
              ),
              actionButton(
                context: context,
                ref: ref,
                username: usernameController,
                email: emailController,
                password: passwordController,
                formKey: _formKey,
              ),
              changeActionButton(context),
            ],
          )
        ],
      ),
    );
  }
}
