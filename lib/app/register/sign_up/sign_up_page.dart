import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import 'sign_up_widget.dart';

class SignUpPage extends ConsumerWidget with SignUpWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            Expanded(
              child: Container(),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(),
                  form(),
                  actionButton(),
                  changeActionButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
