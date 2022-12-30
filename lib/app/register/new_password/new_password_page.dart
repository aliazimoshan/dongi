import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import './new_password_widget.dart';

class NewPasswordPage extends ConsumerWidget with NewPasswordWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.background,
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            decoration: BoxDecoration(
              color: ColorConfig.pureWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                form(),
                actionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
