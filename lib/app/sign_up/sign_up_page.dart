import 'package:dongi/constants/color_config.dart';
import 'package:dongi/constants/font_config.dart';
import 'package:dongi/constants/size_config.dart';
import 'package:dongi/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              flex: 2,
              child: Container(
                  // color: Colors.amber,
                  ),
            ),
            Expanded(
              flex: 3,
              child: Container(
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
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: ColorConfig.primarySwatch,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: ColorConfig.primarySwatch,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('data'),
                        Text('data'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
