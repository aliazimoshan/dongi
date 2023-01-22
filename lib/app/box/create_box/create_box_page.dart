import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/appbar/appbar.dart';
import 'create_box_widget.dart';

class CreateBoxPage extends ConsumerWidget with CreateBoxWidget {
  const CreateBoxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(title: "Create Box"),
      body: Column(
        children: [
          boxInfoCard(context),
          selectFriendsCard(context),
          const Spacer(),
          createButton(),
        ],
      ),
    );
  }
}
