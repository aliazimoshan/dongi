import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import 'sign_up_widget.dart';

class SignUpPage extends ConsumerWidget with SignUpWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            Expanded(
              child: Container(),
            ),
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
