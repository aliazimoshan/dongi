import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import './sign_in_widget.dart';

class SignInPage extends HookConsumerWidget with SignInWidget {
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
          signinBody(
            children: [
              title(),
              form(
                ref: ref,
                formKey: _formKey,
                email: emailController,
                password: passwordController,
              ),
              actionButton(
                formKey: _formKey,
                context: context,
                ref: ref,
                email: emailController,
                password: passwordController,
              ),
              changeActionButton(context),
            ],
          ),
        ],
      ),
    );
  }
}
