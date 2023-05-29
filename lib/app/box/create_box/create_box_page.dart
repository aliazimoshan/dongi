import 'dart:io';

import 'package:dongi/app/box/controller/box_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../core/utils.dart';
import '../../../widgets/appbar/appbar.dart';
import 'create_box_widget.dart';

class CreateBoxPage extends HookConsumerWidget {
  final String groupId;
  CreateBoxPage(this.groupId, {super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxTitle = useTextEditingController();
    final boxDescription = useTextEditingController();
    final image = useState<File?>(null);

    /// by using listen we are not gonna rebuild our app
    ref.listen<BoxState>(
      boxNotifierProvider,
      (previous, next) {
        next.whenOrNull(
            loaded: () {
              showSnackBar(context, "Successfully Created!!");
              context.pop();
            },
            error: (message) => showSnackBar(context, message));
      },
    );

    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(title: "Create Box"),
      body: Column(
        children: [
          CreateBoxInfoCard(
            image: image,
            boxTitle: boxTitle,
            boxDescription: boxDescription,
            formKey: _formKey,
          ),
          const CreateBoxSelectFriends(),
          const Spacer(),
          CreateBoxButton(
            formKey: _formKey,
            image: image,
            boxTitle: boxTitle,
            boxDescription: boxDescription,
            groupId: groupId,
          ),
        ],
      ),
    );
  }
}
