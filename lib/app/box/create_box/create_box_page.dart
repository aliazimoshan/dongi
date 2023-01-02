import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import 'create_box_widget.dart';

class CreateBoxPage extends ConsumerWidget with CreateBoxWidget {
  const CreateBoxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorConfig.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  boxInfoCard(context),
                  selectFriendsCard(context),
                  const Spacer(),
                  createButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
